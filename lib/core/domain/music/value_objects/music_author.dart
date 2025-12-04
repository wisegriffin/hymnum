class MusicAuthor {
  final String? value;

  MusicAuthor._(this.value);

  static MusicAuthor create(String? value) {
    if (value != null && value.isEmpty) {
      throw Exception("Validation failed");
    }
    return MusicAuthor._(value);
  }
}
