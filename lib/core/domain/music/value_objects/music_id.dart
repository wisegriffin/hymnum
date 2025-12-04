import 'package:uuid/uuid.dart';

class MusicId {
  final String value;

  const MusicId._(this.value);


  static MusicId generate() {
    final uuid = Uuid();
    return MusicId._(uuid.v7());
  }
}