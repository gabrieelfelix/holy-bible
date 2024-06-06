import 'package:holybible/features/domain/entities/verse_entity.dart';

class ChapterEntity {
  final int chapter;
  final List<VerseEntity> verses;

  ChapterEntity({
    required this.chapter,
    required this.verses,
  });
}
