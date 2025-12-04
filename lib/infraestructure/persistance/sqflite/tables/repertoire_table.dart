abstract class RepertoireTable {
  static const String tableName = 'repertoires';
  static const String columnId = 'id';
  static const String columnName = 'name';

  static const List<String> allColumns = [columnId, columnName];
    
  static final String createTable= '''
    CREATE TABLE IF NOT EXISTS repertoires (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL
    );
    ''';
}