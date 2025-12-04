import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hymnum/core/application/ports/in/repertoire_usecases.dart';
import 'package:hymnum/core/domain/repertoire/repertoire_snapshot.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_name.dart';
import 'package:hymnum/presentation/repertoire/models/repertoire_model.dart';

class RepertoireViewmodel with ChangeNotifier {
  // TODO: Decople from domain

  late final StreamSubscription<List<RepertoireSnapshot>> _subscription;
  final RepertoireUsecases _repertoireUsecases;
  List<RepertoireModel> _repertoires =  [];

  RepertoireViewmodel(this._repertoireUsecases) {
    _subscription = _repertoireUsecases.watchAll().listen((data) {
      _repertoires = data.map((e) => RepertoireModel(e.id, e.name, e.musics.length),).toList();
      notifyListeners();
    });
    _repertoireUsecases.findAll();
  }


  List<RepertoireModel> get repertoires => List.unmodifiable(_repertoires);

  Future<void> add(String name) async {
    await _repertoireUsecases.create(name: RepertoireName.create(name));
  }

  RepertoireModel? findByIndex(int index) {
    return repertoires.isEmpty ? null : repertoires[index];
  }

  Future<void> rename(RepertoireModel repertory, String newName) async {
    await _repertoireUsecases.rename(RepertoireId(repertory.localId), RepertoireName.create(newName));
  }

  Future<void> delete(RepertoireModel repertory) async {
    await _repertoireUsecases.delete(RepertoireId(repertory.localId));
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
