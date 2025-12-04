import 'package:hymnum/core/domain/repertoire/repertoire.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';

abstract interface class RepertoireRepository {
  Future<void> save(Repertoire repertoire);
  Future<void> delete(RepertoireId id);
  Future<List<Repertoire>> findAll();
  Future<Repertoire?> findById(RepertoireId id);
}