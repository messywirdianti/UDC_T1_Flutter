import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final String data;
  const SecondRoute({Key? key,required this.data}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
            Text("Passed data: $data"),
          ],
        ),
      ),
    );
  }
}
