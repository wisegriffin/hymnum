class MusicTitle {
  final String value;

  const MusicTitle._(this.value);

  static MusicTitle create(String value) {
    if (validate(value)) {
      return MusicTitle._(value);
    }

    throw Exception("Validation failed");
  }

  static bool validate(String value) {
    return value.isNotEmpty;
  }
}