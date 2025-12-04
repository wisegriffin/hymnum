import 'package:hymnum/core/domain/music/music.dart';

class RepertoireSnapshot {
  final String id;
  final String name;
  final List<MusicSnapshot> musics;

  RepertoireSnapshot(this.id, this.name, this.musics);
}