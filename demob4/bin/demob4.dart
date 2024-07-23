import 'dart:convert';

import 'package:demob4/Post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>?> fetchPosts() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    List<Post> posts = jsonList.map((json) => Post.fromJson(json)).toList();
    return posts;
  } else {
    print("Failed to fetch data");
    return null;
  }
}

String convertToJson(Post post) {
  final jsonData = post.toJson();
  return jsonEncode(jsonData);
}

void main(List<String> arguments) {
  fetchPosts().then((posts) {
    if (posts != null) {
      for (var post in posts) {
        print(convertToJson(post));
        print("-----------------------------------------");
      }
    } else {
      print("Failed to fetch data");
    }
  });
}
