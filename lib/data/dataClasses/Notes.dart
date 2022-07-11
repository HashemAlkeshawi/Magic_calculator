class Note {
  String? heading = '';
  String? content = '';
  DateTime? dateTime;

  Note(this.heading, this.content, this.dateTime);

  Note.fromJson(Map<String, dynamic> map) {
    heading = map['heading'];
    content = map['content'];
    dateTime = map['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'heading': heading,
      'content': content,
      'datetime': DateTime.now(),
    };
  }
}
