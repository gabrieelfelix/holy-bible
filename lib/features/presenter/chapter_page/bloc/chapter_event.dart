part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class GetChapterEvent extends ChapterEvent {}
