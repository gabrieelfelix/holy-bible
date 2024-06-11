import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holybible/core/usecase/usecase.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';
import 'package:holybible/features/domain/usecases/get_chapter_usecase.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final IUseCase _getChapterUsecase;
  ChapterBloc({required GetChapterUsecase getChapterUsecase})
      : _getChapterUsecase = getChapterUsecase,
        super(ChapterInitial()) {
    on<GetChapterEvent>((event, emit) async {
      emit(ChapterLoading());

      final response = await _getChapterUsecase(NoParams());

      response.fold(
        (failure) => emit(
          ChapterFailure(message: failure.toString()),
        ),
        (success) => emit(
          ChapterSuccess(chapter: success),
        ),
      );
    });
  }
}
