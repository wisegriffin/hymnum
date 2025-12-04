import 'package:hymnum/core/domain/repertoire/out/repertoire_repository.dart';
import 'package:hymnum/core/domain/repertoire/repertoire.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/mappers/repertoire_sqflite_mapper.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/tables/repertoire_table.dart';
import 'package:sqflite/sqlite_api.dart';

class RepertoireSqfliteRepository implements RepertoireRepository {
  final Database _database;

  RepertoireSqfliteRepository(this._database);

  @override
  Future<void> delete(RepertoireId id) async {
    await _database.delete(
      RepertoireTable.tableName,
      where: "${RepertoireTable.columnId} = ?",
      whereArgs: [id.value],
    );
  }

  @override
  Future<List<Repertoire>> findAll() async {
    final List<Repertoire> repertoires = [];

    final result = await _database.query(RepertoireTable.tableName);
    for (var element in result) {
      repertoires.add(RepertoireSqfliteMapper.fromMap(element));
    }
    return repertoires;
  }

  @override
  Future<void> save(Repertoire repertoire) async {
    if (await findById(repertoire.localId) == null) {
      await _database.insert(RepertoireTable.tableName, RepertoireSqfliteMapper.toMap(repertoire));
      return;
    }

    await _database.update(RepertoireTable.tableName, RepertoireSqfliteMapper.toMap(repertoire));
  }
  
  @override
  Future<Repertoire?> findById(RepertoireId id) async {
    final result = await _database.query(RepertoireTable.tableName, where: "${RepertoireTable.columnId} = ?", whereArgs: [id.value]);

    try {
      return RepertoireSqfliteMapper.fromMap(result.single);
    } catch (e) {
      return null;
    }
  }
}
