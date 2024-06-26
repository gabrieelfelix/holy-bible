import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holybible/core/error/exception.dart';
import 'package:holybible/core/error/failure.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/data/models/chapter_model.dart';
import 'package:holybible/features/data/models/verse_model.dart';
import 'package:holybible/features/data/repositories/chapter_repository.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockChapterDataSource extends Mock implements IChapterDataSource {}

void main() {
  late IChapterDataSource dataSource;
  late ChapterRepository repository;
  setUp(() {
    dataSource = MockChapterDataSource();
    repository = ChapterRepository(dataSource: dataSource);
  });

  const tChapterModel = ChapterModel(
    name: 'Salmos',
    chapter: 23,
    verses: [
      VerseModel(
          verse: 1,
          verseContent: "O Senhor é o meu pastor; de nada terei falta."),
      VerseModel(
          verse: 2,
          verseContent:
              "Em verdes pastagens me faz repousar e me conduz a águas tranqüilas;"),
      VerseModel(
          verse: 3,
          verseContent:
              "restaura-me o vigor. Guia-me nas veredas da justiça por amor do seu nome."),
      VerseModel(
          verse: 4,
          verseContent:
              "Mesmo quando eu andar por um vale de trevas e morte, não temerei perigo algum, pois tu estás comigo; a tua vara e o teu cajado me protegem."),
      VerseModel(
          verse: 5,
          verseContent:
              "Preparas um banquete para mim à vista dos meus inimigos. Tu me honras, ungindo a minha cabeça com óleo e fazendo transbordar o meu cálice."),
      VerseModel(
          verse: 6,
          verseContent:
              "Sei que a bondade e a fidelidade me acompanharão todos os dias da minha vida, e voltarei à casa do Senhor enquanto eu viver."),
    ],
  );

  group("verify get chapter requisition", () {
    test("should return a model when calls the data source", () async {
      //arrange
      when(() => dataSource.getChapter())
          .thenAnswer((_) async => tChapterModel);

      //act
      final response = await repository.getChapter();
      //assert
      expect(response, const Right(tChapterModel));
      verify(() => dataSource.getChapter()).called(1);
    });

    test("should return a server exception error when calls the data source",
        () async {
      //arrange
      when(() => dataSource.getChapter()).thenThrow(const ServerException());

      //act
      final response = await repository.getChapter();
      //assert
      expect(
          response,
          equals(const Left<Failure, ChapterEntity>(
              GetChapterFailure(message: 'Ocorreu um erro no servidor.'))));
      verify(() => dataSource.getChapter()).called(1);
    });

    test('should return a http exception error when calls the data source',
        () async {
      //arrange
      when(() => dataSource.getChapter()).thenThrow(
          const HttpErrorException(data: "Chapter not found", statusCode: 404));

      //act
      final response = await repository.getChapter();

      //assert
      expect(
        response,
        equals(
          const Left<Failure, ChapterEntity>(
            GetChapterFailure(message: 'Chapter not found'),
          ),
        ),
      );
      verify(() => dataSource.getChapter()).called(1);
    });
  });
}
