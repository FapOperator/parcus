import 'package:equatable/equatable.dart';

class ApiErrorEntity extends Equatable {
  final String errorMessage;

  const ApiErrorEntity({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
