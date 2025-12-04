import 'package:uuid/uuid.dart';

class RepertoireId {
  String value;

  RepertoireId(this.value) {
    if (value.isEmpty) {
      throw Exception("Empty id");
    }
  }

  static RepertoireId generate() {
    return RepertoireId(Uuid().v7());
  }

  static RepertoireId fromSQLite(String id) {
    if (id.isNotEmpty) {
      return RepertoireId(id);
    }

    throw Exception("Invalid id");
  }
}
