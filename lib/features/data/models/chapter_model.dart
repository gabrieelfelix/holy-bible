import 'package:holybible/features/data/models/verse_model.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';

class ChapterModel extends ChapterEntity {
  ChapterModel({required super.chapter, required super.verses});

  // Empty user witch represents an unauthenticaded user
  static final empty = ChapterModel(chapter: -1, verses: []);

  //modify userModel parameters
  ChapterModel copyWith(
      {required int? chapter, required List<VerseModel>? verses}) {
    return ChapterModel(
      chapter: chapter ?? this.chapter,
      verses: verses ?? this.verses,
    );
  }

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      chapter: json['chapter']['number'],
      verses: json['verses'].map((itemJson) {
        return VerseModel.fromJson(itemJson);
      }).toList(),
    );
  }

  // Convenience getter to determine whether the current user is empty
  bool get isEmpty => this == ChapterModel.empty;
  // Convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != ChapterModel.empty;
}
