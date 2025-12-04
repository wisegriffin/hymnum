import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/music/value_objects/music_author.dart';
import 'package:hymnum/core/domain/music/value_objects/music_id.dart';
import 'package:hymnum/core/domain/music/out/music_repository.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/mappers/music_sqflite_mapper.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/tables/music_table.dart';
import 'package:sqflite/sqlite_api.dart';

class MusicSqfliteRepository implements MusicRepository {
  final Database _database;

  MusicSqfliteRepository(this._database);

  @override
  Future<void> deleteById(MusicId id) async {
    await _database.delete(
      MusicTable.tableName,
      where: "${MusicTable.columnId} = ?",
      whereArgs: [id.value],
    );
  }

  @override
  Future<List<Music>> findByAuthor(MusicAuthor author) {
    // TODO: implement findByAuthor
    throw UnimplementedError();
  }

  @override
  Future<Music?> findById(MusicId id) async {
    final result = await _database.query(
      MusicTable.tableName,
      where: '${MusicTable.columnId} = ?',
      whereArgs: [id.value],
    );

    try {
      return MusicSqfliteMapper.fromMap(result.single);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Music>> findByTags() {
    // TODO: implement findByTags
    throw UnimplementedError();
  }

  @override
  Future<void> save(Music music) async {
    if (await findById(music.localId) == null){
      await _database.insert(MusicTable.tableName, MusicSqfliteMapper.toMap(music));
      return;
    }

    await _database.update(MusicTable.tableName, MusicSqfliteMapper.toMap(music));
  }
}
