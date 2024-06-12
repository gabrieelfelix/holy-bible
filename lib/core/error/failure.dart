import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [message];
}

class GetChapterFailure extends Failure {
  const GetChapterFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

/// temporary class for testing
class FailureTest extends Failure {
  const FailureTest({required super.message});
  @override
  List<Object?> get props => [message];
}
