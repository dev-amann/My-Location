import 'dart:convert';
import 'package:http/http.dart' as http;

import 'author_model.dart';

Future<List<AuthorModel>> getData() async {
  List<AuthorModel> dashBoardPaths = [];
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
  print(response.body);

  try {
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      dashBoardPaths = (json.decode(response.body) as List)
          .map((data) => AuthorModel.fromJson(data))
          .toList();
      return dashBoardPaths;
    } else {
      return dashBoardPaths;
    }
  } catch (err) {
    print(err);
    return dashBoardPaths;
  }
}
