import 'package:dartz/dartz.dart';
import 'package:holybible/core/error/exception.dart';
import 'package:holybible/core/error/failure.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:holybible/features/domain/repositories/chapter_repo.dart';

class ChapterRepository implements IChapterRepository {
  IChapterDataSource dataSource;

  ChapterRepository({required this.dataSource});

  @override
  Future<Either<Failure, ChapterEntity>> getChapter() async {
    try {
      final response = await dataSource.getChapter();
      return Right(response);
    } on ServerException catch (e) {
      return Left(GetChapterFailure(message: e.toString()));
    }
  }
}
