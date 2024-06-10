import 'package:equatable/equatable.dart';

class VerseEntity extends Equatable {
  final int verse;
  final String verseContent;

  const VerseEntity({
    required this.verse,
    required this.verseContent,
  });

  @override
  List<Object> get props => [verseContent, verse];
}
