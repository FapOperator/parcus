// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcus/config/constant.dart';
import 'package:parcus/core/error/exeption.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Uri _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((dynamic key, dynamic value) {
        paramsString += '?$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.PARSING_URL}$path$paramsString');
  }

  dynamic post(
    String path, {
    Map<dynamic, dynamic>? params,
  }) async {
    final response = await _client.post(
      _getPath(path, null),
      body: jsonEncode(params),
      headers: {
        "Access-Control-Allow-Headers": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.body.contains('"error":')) {
      throw ServerException<dynamic>(
        error: json.decode(response.body),
      );
    } else if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw Exception(response.reasonPhrase);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic get(
    String path, {
    String? token,
    Map<dynamic, dynamic>? params,
  }) async {
    final response = await _client.get(
      _getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Token $token"
      },
    );
    if (response.body.contains('"error":')) {
      throw ServerException<dynamic>(
        error: json.decode(response.body),
      );
    } else if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw Exception(response.reasonPhrase);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
