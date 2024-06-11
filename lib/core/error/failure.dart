import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetChapterFailure extends Failure {
  final String message;

  GetChapterFailure({required this.message});
  @override
  List<Object?> get props => [];
}

class FailureTest extends Failure {
  @override
  List<Object?> get props => [];
}
