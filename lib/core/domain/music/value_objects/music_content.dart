class MusicContent {
  final String? value;

  MusicContent._(this.value);

  static MusicContent create(String? value) {
    return MusicContent._(value);
  }
}