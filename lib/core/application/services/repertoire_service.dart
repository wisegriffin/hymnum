import 'dart:async';

import 'package:hymnum/core/application/ports/in/repertoire_usecases.dart';
import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/repertoire/out/repertoire_repository.dart';
import 'package:hymnum/core/domain/repertoire/repertoire.dart';
import 'package:hymnum/core/domain/repertoire/repertoire_snapshot.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_name.dart';

class RepertoireService implements RepertoireUsecases {
  final RepertoireRepository _repository;

  final StreamController<Map<String, List<MusicSnapshot>>>
  _musicsStreamController = StreamController.broadcast();

  final StreamController<List<RepertoireSnapshot>>
  _repertoiresStreamController = StreamController.broadcast();

  RepertoireService(this._repository);

  @override
  Future<RepertoireSnapshot> create({
    required RepertoireName name,
    List<Music>? musics,
  }) async {
    final Repertoire repertoire = Repertoire.create(
      name: name.value,
      musics: musics,
    );
    await _repository.save(repertoire);

    final savedRepertoire = await _repository.findById(repertoire.localId);
    if (savedRepertoire == null) throw Exception("Repertoire not saved");

    _emitRepertoires();
    return savedRepertoire.snapshot();
  }

  @override
  Future<void> delete(RepertoireId id) async {
    await _repository.delete(id);
    _emitRepertoires();
  }

  @override
  Future<List<RepertoireSnapshot>> findAll() async {
    final result = await _repository.findAll();
    final snapshots = result.map((e) => e.snapshot()).toList();
    _repertoiresStreamController.add(snapshots);
    return snapshots;
  }

  @override
  Future<void> rename(RepertoireId id, RepertoireName newName) async {
    final repertoire = await _repository.findById(id);
    if (repertoire == null) throw Exception("Repertoire not found");

    repertoire.rename(newName);
    await _repository.save(repertoire);
    _emitRepertoires();
  }

  @override
  Stream<List<RepertoireSnapshot>> watchAll() =>
      _repertoiresStreamController.stream;

  Future<void> _emitRepertoires() async {
    // ! This is very likely to be a problem
    // TODO: Refactor this
    final result = await _repository.findAll();
    final snapshots = result.map((e) => e.snapshot()).toList();
    _repertoiresStreamController.add(snapshots);
  }
  
  @override
  Future<void> addMusic(RepertoireId repertoireId, Music music) async {
    final repertoire = await _repository.findById(repertoireId);
    if (repertoire == null) throw Exception("Repertoire not found");

    repertoire.addMusic(music);

    _emitRepertoires();
  } 
  
  @override
  Future<void> removeMusic(RepertoireId repertoireId, Music music) async {
    final repertoire = await _repository.findById(repertoireId);
    if (repertoire == null) throw Exception("Repertoire not found");

    repertoire.removeMusic(music);
    
    _emitRepertoires();
  }
}
