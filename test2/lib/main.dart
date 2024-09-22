import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = '';

  Future<void> db() async {

    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'flutter_login',
    ));

    // Mengambil data dari database
    var userId = 1;
    var results = await conn.query('SELECT name, jobtitle FROM user WHERE id = ?', [userId]);

    // Mengupdate UI dengan hasil query
    setState(() {
      // Mengubah hasil query menjadi string untuk ditampilkan
      data = results.map((row) => 'Name: ${row['name']}, Job Title: ${row['jobtitle']}').join('\n');
    });

    // Menutup koneksi ke database
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data), // Menampilkan data dari database
            ElevatedButton(
              onPressed: db,
              child: Text("Fetch Data"),
            ),
          ],
        ),
      ),
    );
  }
}
