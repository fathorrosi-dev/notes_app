class NoteModel {
  int? id;
  String title;

  NoteModel({this.id, required this.title});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(id: map['id'], title: map['title']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }

  NoteModel copyWith({int? id, String? title}) {
    return NoteModel(id: id ?? this.id, title: title ?? this.title);
  }
}
