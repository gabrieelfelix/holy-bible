import 'package:dartz/dartz.dart';
import 'package:holybible/core/error/failure.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';

abstract class IChapterRepository {
  Future<Either<Failure, ChapterEntity>> getChapter();
}
