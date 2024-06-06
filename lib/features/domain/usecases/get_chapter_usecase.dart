import 'package:dartz/dartz.dart';
import 'package:holybible/core/error/failure.dart';
import 'package:holybible/core/usecase/usecase.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:holybible/features/domain/repositories/chapter_repo.dart';

class GetChapterUsecase implements IUseCase<ChapterEntity, NoParams> {
  final IChapterRepository repository;

  GetChapterUsecase({required this.repository});
  @override
  Future<Either<Failure, ChapterEntity>> call(NoParams params) async {
    return await repository.getChapter();
  }
}
