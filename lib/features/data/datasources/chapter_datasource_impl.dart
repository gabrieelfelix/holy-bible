import 'dart:convert';

import 'package:holybible/core/app_client/client_repo.dart';
import 'package:holybible/core/error/exception.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/data/endpoints/abibliadigital_points.dart';
import 'package:holybible/features/data/models/chapter_model.dart';

class ChapterDataSource implements IChapterDataSource {
  final IClientHttp client;

  ChapterDataSource({required this.client});

  @override
  Future<ChapterModel> getChapter() async {
    final response = await client.get(
        url: AbibliadigitalEndpoints.chapter(abrevBook: 'gn', chapter: 50));
    if (response.statusCode == 200) {
      return ChapterModel.fromJson(jsonDecode(response.data));
    } else {
      throw HttpErrorException(
          data: jsonDecode(response.data)['msg'],
          statusCode: response.statusCode);
    }
  }
}
