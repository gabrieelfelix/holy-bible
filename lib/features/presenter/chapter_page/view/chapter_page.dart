import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holybible/features/domain/repositories/chapter_repo.dart';
import 'package:holybible/features/domain/usecases/get_chapter_usecase.dart';
import 'package:holybible/features/presenter/chapter_page/bloc/chapter_bloc.dart';
import 'package:holybible/main.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChapterBloc(
          getChapterUsecase:
              GetChapterUsecase(repository: sl<IChapterRepository>()))
        ..add(GetChapterEvent()),
      child: const ChapterView(),
    );
  }
}

class ChapterView extends StatefulWidget {
  const ChapterView({super.key});

  @override
  State<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChapterBloc, ChapterState>(
        builder: (context, state) {
          if (state is ChapterLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeCap: StrokeCap.round,
              ),
            );
          } else if (state is ChapterSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ListView.builder(
                    itemCount: state.chapter.verses.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0)
                            Text(
                              '${state.chapter.name} ${state.chapter.chapter.toString()}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.chapter.verses[index].verse
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' ${state.chapter.verses[index].verseContent}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      );
                    }),
              ),
            );
          } else if (state is ChapterFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
