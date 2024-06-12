import 'package:equatable/equatable.dart';
import 'package:holybible/features/domain/entities/verse_entity.dart';

class ChapterEntity extends Equatable {
  final int chapter;
  final List<VerseEntity> verses;
  final String name;

  const ChapterEntity({
    required this.name,
    required this.chapter,
    required this.verses,
  });

  @override
  List<Object> get props => [chapter, verses, name];
}
