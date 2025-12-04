import '../value_objects/music_author.dart';
import '../value_objects/music_id.dart';
import '../music.dart';

abstract interface class MusicRepository {
  Future<void> deleteById(MusicId id);
  Future<void> save(Music music);
  Future<Music?> findById(MusicId id);
  Future<List<Music>> findByAuthor(MusicAuthor author);
  Future<List<Music>> findByTags();
}