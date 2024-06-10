import 'package:holybible/features/data/models/chapter_model.dart';

abstract class IChapterDataSource {
  Future<ChapterModel> getChapter();
}
