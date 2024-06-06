import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holybible/core/usecase/usecase.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:holybible/features/domain/entities/verse_entity.dart';
import 'package:holybible/features/domain/repositories/chapter_repo.dart';
import 'package:holybible/features/domain/usecases/get_chapter_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockChapterRepository extends Mock implements IChapterRepository {}

void main() {
  late GetChapterUsecase usecase;
  late IChapterRepository repository;

  setUp(() {
    repository = MockChapterRepository();
    usecase = GetChapterUsecase(repository: repository);
  });

  final tChapterEntity = ChapterEntity(
    chapter: 23,
    verses: [
      VerseEntity(
          verse: 1,
          verseContent: "O Senhor é o meu pastor; de nada terei falta."),
      VerseEntity(
          verse: 2,
          verseContent:
              "Em verdes pastagens me faz repousar e me conduz a águas tranqüilas;"),
      VerseEntity(
          verse: 3,
          verseContent:
              "restaura-me o vigor. Guia-me nas veredas da justiça por amor do seu nome."),
      VerseEntity(
          verse: 4,
          verseContent:
              "Mesmo quando eu andar por um vale de trevas e morte, não temerei perigo algum, pois tu estás comigo; a tua vara e o teu cajado me protegem."),
      VerseEntity(
          verse: 5,
          verseContent:
              "Preparas um banquete para mim à vista dos meus inimigos. Tu me honras, ungindo a minha cabeça com óleo e fazendo transbordar o meu cálice."),
      VerseEntity(
          verse: 6,
          verseContent:
              "Sei que a bondade e a fidelidade me acompanharão todos os dias da minha vida, e voltarei à casa do Senhor enquanto eu viver."),
    ],
  );

  final tNoParams = NoParams();

  test('should get chapter from book', () async {
    when(() => repository.getChapter())
        .thenAnswer((_) async => Right(tChapterEntity));

    final response = await usecase(tNoParams);

    expect(response, Right(tChapterEntity));
    verify(() => repository.getChapter()).called(1);
  });
}
