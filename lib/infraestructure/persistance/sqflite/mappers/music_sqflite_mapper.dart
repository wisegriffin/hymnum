import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/infraestructure/persistance/sqflite/tables/music_table.dart';

abstract class MusicSqfliteMapper {
  
  static Music fromMap(Map<String, Object?> map) {
    Music music = Music.create(
      title: map[MusicTable.columnTitle] as String,
      author: map[MusicTable.columnAuthor] as String,
      content: map[MusicTable.columnContent] as String,
      key: map[MusicTable.columnKey] as String,
    );
    return music;
  }

  static Map<String, Object?> toMap(Music music) {
    final snapshot = music.snapshot();
    return {
      MusicTable.columnId: snapshot.localId,
      MusicTable.columnTitle: snapshot.title,
      MusicTable.columnAuthor: snapshot.author,
      MusicTable.columnContent: snapshot.content,
      MusicTable.columnKey: snapshot.key,
    };
  }
}