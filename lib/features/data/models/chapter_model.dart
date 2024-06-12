import 'package:holybible/features/data/models/verse_model.dart';
import 'package:holybible/features/domain/entities/chapter_entity.dart';

class ChapterModel extends ChapterEntity {
  const ChapterModel(
      {required super.chapter, required super.verses, required super.name});

  // Empty user witch represents an unauthenticaded user
  static const empty = ChapterModel(chapter: -1, verses: [], name: '');

  //modify userModel parameters
  ChapterModel copyWith({
    required int? chapter,
    required List<VerseModel>? verses,
    required String? name,
  }) {
    return ChapterModel(
      chapter: chapter ?? this.chapter,
      verses: verses ?? this.verses,
      name: name ?? this.name,
    );
  }

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      chapter: json['chapter']['number'],
      name: json['book']['name'],
      verses: json['verses'].map<VerseModel>((itemJson) {
        return VerseModel.fromJson(itemJson);
      }).toList(),
    );
  }

  // Convenience getter to determine whether the current user is empty
  bool get isEmpty => this == ChapterModel.empty;
  // Convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != ChapterModel.empty;

  @override
  List<Object> get props => [chapter, verses];
}
