import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final url = Uri.parse(
        'http://ec2-34-245-11-228.eu-west-1.compute.amazonaws.com:3000/merchant/getallMerchentsData');
    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1ZDM1YWU2MjI3ZjAxNTIxOGM1ZTkwZDEiLCJpYXQiOjE1NjQxMzMxMDV9.YLv0uKU7NFUO4FvdXp5QClxrN8dBm2j1nHuE6RBdexo"
    });

    if (response.statusCode == 200) {
      final books = json.decode(response.body);
      // var data = json['data'].map((e)=>ChildModel.fromJson(e)).toList()
      print(books['data'][0]['email']);
      List bookstore = books['data'];
      return bookstore;
      .map((json) => Book.fromJson(json)).where((book) {
        // final titleLower = book.message.toLowerCase();
        final authorLower = book['email'].toLowerCase();
        print("email List : ${book['email'].toLowerCase()}");
        final searchLower = query.toLowerCase();

        return
            // titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
