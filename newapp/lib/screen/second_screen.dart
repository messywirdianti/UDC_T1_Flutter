import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String quoteText;
  final String authorName;

  const SecondScreen({Key? key, required this.quoteText, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            quoteText,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Align(alignment: Alignment.bottomRight, child: Text(
            "- $authorName",
          style: TextStyle(fontSize: 18),
        )),
      ]),
    ),
    );
  }
}
