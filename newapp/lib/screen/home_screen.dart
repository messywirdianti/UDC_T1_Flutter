import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/screen/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(

        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                quote,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child : Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "- $author",
                  style: TextStyle(fontSize: 20),
                ),
              )

            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                var response = await http.get(url);
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');

                  var data = jsonDecode(response.body);

                  // Mengakses data dari JSON
                  quote = data["content"];
                  author = data["author"];

                  setState(() {

                  });

                  // // Navigasi ke screen berikutnya dengan mengirim data
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) =>
                  //         SecondScreen(
                  //           quoteText: quote,
                  //           authorName: author,
                  //         )));
                },
                child:const Text("Get qoute!"),
            ),
          ],
        ),
      ),
    );

  }
}
