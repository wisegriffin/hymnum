class MusicKey {
  // TODO: Implement tonal keys logic and validation
  final String value;

  const MusicKey._(this.value);

  static MusicKey create({String? key}) {
    if (key == null || key.isEmpty) {
      return MusicKey._("C");
    }

    return MusicKey._(key);
  }
}