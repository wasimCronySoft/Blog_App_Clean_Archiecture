import 'package:clean_arch_application/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class AsyncUseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}
