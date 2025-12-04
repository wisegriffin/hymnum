import 'package:hymnum/core/domain/music/value_objects/search_music_criteria.dart';

import '../../../domain/music/value_objects/music_id.dart';
import '../../../domain/music/music.dart';

abstract interface class MusicUsecases {
  Future<void> save(Music music);
  Future<void> delete(Music music);
  Future<List<Music>> fetchAll();
  Future<List<Music>> find(SearchMusicCriteria criteria);
}
