class Note {
  String? heading = '';
  String? content = '';

  Note.fromJson(Map<String, dynamic> map) {
    this.heading = map['heading'];
    this.content = map['content'];
  }
}
