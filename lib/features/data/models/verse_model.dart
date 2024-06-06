import 'package:holybible/features/domain/entities/verse_entity.dart';

class VerseModel extends VerseEntity {
  VerseModel({required super.verse, required super.verseContent});

  // Empty user witch represents an unauthenticaded user
  static final empty = VerseModel(verse: -1, verseContent: '');

  //modify userModel parameters
  VerseModel copyWith({required int? verse, required String? verseContent}) {
    return VerseModel(
      verse: verse ?? this.verse,
      verseContent: verseContent ?? this.verseContent,
    );
  }

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(
      verse: int.parse(json['number']),
      verseContent: json['text'],
    );
  }

  // Convenience getter to determine whether the current user is empty
  bool get isEmpty => this == VerseModel.empty;
  // Convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != VerseModel.empty;
}
