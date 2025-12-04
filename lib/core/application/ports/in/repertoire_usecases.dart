import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/repertoire/repertoire_snapshot.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_name.dart';

abstract interface class RepertoireUsecases {
  Future<void> rename(RepertoireId id, RepertoireName newName);
  Future<RepertoireSnapshot> create({required RepertoireName name, List<Music>? musics});
  Future<void> delete(RepertoireId id);

  Future<void> addMusic(RepertoireId repertoireId, Music music);
  Future<void> removeMusic(RepertoireId repertoireId, Music music);
  
  Future<List<RepertoireSnapshot>> findAll();
  Stream<List<RepertoireSnapshot>> watchAll();
}