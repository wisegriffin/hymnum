import 'package:hymnum/core/domain/repertoire/repertoire.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/tables/repertoire_table.dart';

abstract class RepertoireSqfliteMapper {
  static Repertoire fromMap(Map<String, Object?> map) {
    return Repertoire.create(
      localId: RepertoireId.fromSQLite(map[RepertoireTable.columnId] as String),
      name: map[RepertoireTable.columnName] as String,
    );
  }

  static Map<String, Object?> toMap(Repertoire repertoire) {
    final snapshot = repertoire.snapshot();
    return {
      RepertoireTable.columnId: snapshot.id,
      RepertoireTable.columnName: snapshot.name,
    };
  }
}
