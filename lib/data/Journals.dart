class Journal {
  String? heading = '';
  String? content = '';
  DateTime? dateTime;

  Journal.fromJson(Map map) {
    this.heading = map['heading'];
    this.content = map['content'];
    this.dateTime = map['datetime'];
  }
}
