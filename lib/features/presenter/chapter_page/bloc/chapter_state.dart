part of 'chapter_bloc.dart';

sealed class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

final class ChapterInitial extends ChapterState {}

final class ChapterLoading extends ChapterState {}

final class ChapterSuccess extends ChapterState {
  const ChapterSuccess({required this.chapter});

  final ChapterEntity chapter;
}

final class ChapterFailure extends ChapterState {
  const ChapterFailure({required this.message});

  final String message;
}
