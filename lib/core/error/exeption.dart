class ServerException<T> implements Exception {
  T? error;
  ServerException({this.error});
}
