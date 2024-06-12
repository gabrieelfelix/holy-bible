import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:holybible/app/app.dart';
import 'package:holybible/core/app_client/client_repo.dart';
import 'package:holybible/core/app_client/http_client.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_impl.dart';
import 'package:holybible/features/data/datasources/chapter_datasource_repo.dart';
import 'package:holybible/features/data/repositories/chapter_repository.dart';
import 'package:holybible/features/domain/repositories/chapter_repo.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const App());
}

final sl = GetIt.instance;

Future<void> init() async {
  // Register HttpClient
  sl.registerLazySingleton<IClientHttp>(() => HttpClient());

  // Register DataSource
  sl.registerLazySingleton<IChapterDataSource>(
      () => ChapterDataSource(client: sl()));

  // Register Repository
  sl.registerLazySingleton<IChapterRepository>(
      () => ChapterRepository(dataSource: sl()));
}
