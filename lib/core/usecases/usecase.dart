import 'package:parcus/core/resourses/data_state.dart';
import 'package:parcus/features/calculator/domain/entities/api_error_entity.dart';

abstract class Usecase<Type, Params> {
  Future<DataState<Type, ApiErrorEntity>> call({required Params params});
}
