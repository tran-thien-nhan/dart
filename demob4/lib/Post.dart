class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
