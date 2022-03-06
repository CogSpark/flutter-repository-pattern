class Book {
  int id;
  String title;
  String author;

  Book(this.id, this.title, this.author);

  Book.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        author = data['author'];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      json['ranking'] as int,
      json['title'] as String,
      json['author'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'author': author};
  }
}
