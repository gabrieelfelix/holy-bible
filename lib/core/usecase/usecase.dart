import 'package:dartz/dartz.dart';
import 'package:holybible/core/error/failure.dart';

abstract class IUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {}
