import 'package:flutter_test/flutter_test.dart';
import 'package:holybible/core/app_client/client_repo.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_impl.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/data/endpoints/abibliadigital_points.dart';
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

  const urlExpected = 'https://www.abibliadigital.com.br/api/verses/nvi/sl/1';

  void successMock() {
    when(
      () => client.get(
        url: AbibliadigitalEndpoints.chapter(abrevBook: 'sl', chapter: 1),
      ),
    ).thenAnswer(
      (_) async => HttpResponse(data: bibleRequisitionSuccess, statusCode: 200),
    );
  }

  group('ChapterDataSource', () {
    test('should call the get method with correct url', () async {
      // Arrange
      successMock();

      // Act
      await dataSource.getChapter();

      // Assert
      verify(() => client.get(url: urlExpected)).called(1);
    });

    test('should return a model when success', () async {
      // Arrange
      successMock();

      //Act
      final response = await dataSource.getChapter();

      //Assert
      expect(response, isA<ChapterEntity>());
    });

    //test all exceptions ...
    // test('should throw a server exception when the call is unccessful',
    //     () async {
    //   when(
    //     () => client.get(
    //       url: AbibliadigitalEndpoints.chapter(abrevBook: 'sl', chapter: 1),
    //     ),
    //   ).thenAnswer(
    //     (_) async =>
    //         HttpResponse(data: bibleRequisitionFailed, statusCode: 404),
    //   );

    //   final response = await dataSource.getChapter();

    //   expect(response, throwsA(ServerException()));
    // });
  });
}
