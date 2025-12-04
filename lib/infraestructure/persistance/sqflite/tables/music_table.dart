abstract class MusicTable {
  static const String tableName = 'musics';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnAuthor = 'author';
  static const String columnContent = 'content';
  static const String columnKey = 'key';

  static const List<String> allColumns = [
    columnId,
    columnTitle,
    columnAuthor,
    columnContent,
    columnKey,
  ];

  static String createTable =
      '''
    CREATE TABLE IF NOT EXISTS ${MusicTable.tableName} (
      ${MusicTable.columnId} TEXT PRIMARY KEY,
      ${MusicTable.columnTitle} TEXT NOT NULL,
      ${MusicTable.columnAuthor} TEXT NOT NULL,
      ${MusicTable.columnContent} TEXT,
      ${MusicTable.columnKey} TEXT
    );
    ''';
}
