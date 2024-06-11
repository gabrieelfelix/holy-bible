import 'package:flutter_test/flutter_test.dart';
import 'package:holybible/core/app_client/client_repo.dart';
import 'package:holybible/core/error/exception.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_impl.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/data/models/chapter_model.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_request.dart';

class HttpClientMock extends Mock implements IClientHttp {}

void main() {
  late IChapterDataSource dataSource;
  late IClientHttp client;

  setUp(() {
    client = HttpClientMock();
    dataSource = ChapterDataSource(client: client);
  });

  void successMock() {
    when(
      () => client.get(
        url: any(named: 'url'),
      ),
    ).thenAnswer(
      (_) async =>
          const HttpResponse(data: bibleRequisitionSuccess, statusCode: 200),
    );
  }

  const tHttpError = """{"msg": "Chapter not found"}""";

  group('ChapterDataSource', () {
    test('should call the get method with correct url', () async {
      // Arrange
      successMock();

      // Act
      await dataSource.getChapter();

      // Assert
      verify(() => client.get(url: any(named: 'url'))).called(1);
    });

    test('should return a model when success', () async {
      // Arrange
      successMock();

      //Act
      final response = await dataSource.getChapter();

      //Assert
      expect(response, isA<ChapterEntity>());
    });

    test('should throw HttpErrorException when status code is not 200',
        () async {
      // Arrange
      when(() => client.get(url: any(named: 'url'))).thenAnswer((_) async =>
          const HttpResponse(
              data: '{"msg": "Chapter not found"}', statusCode: 404));

      // Act & Assert
      expect(() async {
        await dataSource.getChapter();
      },
          throwsA(isA<HttpErrorException>()
              .having((e) => e.statusCode, 'statusCode', 404)
              .having((e) => e.data, 'data', 'Chapter not found')));

      // Verify
      verify(() => client.get(url: any(named: 'url'))).called(1);
    });
  });
}
