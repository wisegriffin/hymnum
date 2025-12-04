class RepertoireName {
  final String value;

  RepertoireName._(this.value);

  static RepertoireName create(String name) {
    if (name.isNotEmpty) {
      return RepertoireName._(name);
    }
    
    throw Exception("Empty repertoire name");
  }
}