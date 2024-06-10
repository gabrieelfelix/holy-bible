import 'package:holybible/features/domain/entities/verse_entity.dart';

class VerseModel extends VerseEntity {
  const VerseModel({required super.verse, required super.verseContent});

  // Empty user witch represents an unauthenticaded user
  static const empty = VerseModel(verse: -1, verseContent: '');

  ///modify VerseModel parameters
  VerseModel copyWith({required int? verse, required String? verseContent}) {
    return VerseModel(
      verse: verse ?? this.verse,
      verseContent: verseContent ?? this.verseContent,
    );
  }

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(
      verse: json['number'],
      verseContent: json['text'],
    );
  }

  /// Convenience getter to determine whether the current verse is empty
  bool get isEmpty => this == VerseModel.empty;

  /// Convenience getter to determine whether the current is verse not empty
  bool get isNotEmpty => this != VerseModel.empty;

  @override
  List<Object> get props => [verse, verseContent];
}
