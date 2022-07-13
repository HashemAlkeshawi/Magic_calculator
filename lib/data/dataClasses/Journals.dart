class Journal {
  String? heading = '';
  String? content = '';
  DateTime? dateTime;

  Journal(this.heading, this.content, this.dateTime);

  Journal.fromJson(Map map) {
    heading = map['heading'];
    content = map['content'];
    dateTime = map['datetime'];
  }

  Map<String, dynamic> toJson() {
    return {
      'heading': heading,
      'content': content,
      'date': DateTime.now(),
    };
  }
}
