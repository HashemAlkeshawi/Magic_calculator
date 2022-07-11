class Journal {
  String? heading = '';
  String? content = '';
  DateTime? dateTime;

  Journal(this.heading, this.content, this.dateTime);

  Journal.fromJson(Map map) {
    this.heading = map['heading'];
    this.content = map['content'];
    this.dateTime = map['datetime'];
  }

  Map<String, dynamic> toJson() {
    return {
      'heading': this.heading,
      'content': content,
      'datetime': DateTime.now()
    };
  }
}
