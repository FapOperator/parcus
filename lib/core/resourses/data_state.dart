sealed class DataState<S, E> {
  const DataState();
}

final class DataSuccess<S, E> extends DataState<S, E> {
  const DataSuccess(this.value);
  final S value;
}

final class DataAppError<S, E> extends DataState<S, E> {
  const DataAppError(this.error);
  final E error;
}

final class DataFailure<S, E> extends DataState<S, E> {
  const DataFailure(this.exception);
  final E exception;
}
