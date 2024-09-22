import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MovieApps(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MovieApps extends StatefulWidget {
  const MovieApps({super.key});

  @override
  State<MovieApps> createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {
  final List<Container> listMovie = [];

  final List<Map<String, String>> daftarMovie = [
    {"nama": "Movie 1", "images": "movie1.jpg"},
    {"nama": "Movie 2", "images": "movie2.jpg"},
    {"nama": "Movie 3", "images": "movie3.jpeg"},
    {"nama": "Movie 4", "images": "movie4.jpg"},
    {"nama": "Movie 5", "images": "movie5.jpg"},
    {"nama": "Movie 6", "images": "movie6.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    buatDataList();
  }

  void buatDataList() {
    for (var movie in daftarMovie) {
      final String images = movie['images'] ?? '';
      final String nama = movie['nama'] ?? '';

      listMovie.add(
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: InkWell(
              onTap: () {
                //pindahkan ke detail
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => DetailMovieApp(
                  nama: nama,
                  gambar : images,
                )));
              },
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Hero(
                    tag: nama,
                    child: Image.asset(
                      'gambar/$images',
                      height: 175.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    nama,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Apps'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          childAspectRatio: itemWidth / itemHeight,
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: listMovie,
        ),
      ),
    );
  }
}

class DetailMovieApp extends StatelessWidget {
  const DetailMovieApp({super.key, required this.nama, required this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: new InkWell(
              child: Image.asset('gambar/$gambar', fit: BoxFit.contain ,),
            ),
          ),
          
          new BagianNama(
            nama : nama
          ),

          const BagianIcon(),

          new BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  const BagianNama({super.key, required this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(nama, style: const TextStyle(fontSize: 20.0, color: Colors.red),),
              Text("$nama\@gmail.com", style: const TextStyle(fontSize: 17.0, color: Colors.grey),)
            ],
          )),

          const Row(
            children: <Widget>[
              const Icon(Icons.star, size: 30.0, color: Colors.red,),
              const Text("12", style: const TextStyle(fontSize: 18.0),),
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: const Row(
        children: <Widget>[
          const IconTeks(
            iconData : Icons.call,
            teks : "Call"
          ),

          const IconTeks(
              iconData : Icons.message,
              teks : "Message"
          ),

          const IconTeks(
              iconData : Icons.photo,
              teks : "Photo"
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  const IconTeks({super.key, required this.iconData, required this.teks});
  final IconData iconData;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(iconData, size: 20.0, color: Colors.red),
          Text(teks, style: const TextStyle(fontSize: 12.0, color: Colors.red)),
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  const BagianKeterangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(fontSize: 14.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}






// class PageImageAssest extends StatelessWidget {
//   const PageImageAssest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('image pada Assest'),
//         backgroundColor: Colors.green,
//       ),
//
//       body: Column(
//         children: <Widget>[
//           Image.asset('gambar/pharmacy.png'),
//           const Text('Obat-obatan'),
//           const SizedBox(height: 25.0,),
//
//           const Text('image from URL', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.red),),
//           new Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Image.network('https://www.konsultanpajaksurabaya.com/uploads/img/foto_berita/ketentuan-pajak-atas-impor-oba_1665997471.jpg',
//               height: 150,
//               width: 150,
//               ),
//
//               Image.network('https://siplah-oss.tokoladang.co.id/merchant/42417/product/K4VmbnYX2TD88USPmJ5yAOLnaLMhcB5nuUClNmve.jpg',
//                 height: 150,
//                 width: 150,
//               ),
//             ],
//           )
//
//         ],
//       ),
//     );
//   }
// }


// class MovieApps extends StatefulWidget {
//   const MovieApps({super.key});
//
//   @override
//   State<MovieApps> createState() => _MovieAppsState();
// }
//
// class _MovieAppsState extends State<MovieApps> {
//   List<Container> listMovie = [];
//
//   var daftarMovie = [
//     {"nama": "Movie 1", "images": "movie1.jpg"},
//     {"nama": "Movie 2", "images": "movie2.jpg"},
//     {"nama": "Movie 3", "images": "movie3.jpeg"},
//     {"nama": "Movie 4", "images": "movie4.jpg"},
//     {"nama": "Movie 5", "images": "movie5.jpg"},
//     {"nama": "Movie 6", "images": "movie6.jpg"},
//   ];
//
//   void _buatDataList() {
//     for (var i = 0; i < daftarMovie.length; i++) {
//       final listMovienya = daftarMovie[i];
//       final images = listMovienya['images']!;
//
//       listMovie.add(
//         Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Card(
//             child: InkWell(
//               onTap: () {
//                 // Handle tap here
//               },
//               child: Column(
//                 children: <Widget>[
//                   const Padding(padding: EdgeInsets.all(10.0)),
//                   Hero(
//                     tag: listMovienya['nama']!,
//                     child: Image.asset(
//                       "assets/gambar/$images",
//                       height: 100.0,
//                       width: 100.0,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10.0)),
//                   Text(
//                     listMovienya['nama']!,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _buatDataList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movie Apps'),
//         backgroundColor: Colors.red,
//       ),
//       body: Container(
//         child: GridView.count(
//           childAspectRatio: (itemWidth / itemHeight),
//           controller: ScrollController(keepScrollOffset: false),
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           crossAxisCount: 2,
//           children: listMovie,
//         ),
//       ),
//     );
//   }
// }


// class PageMainAnimation extends StatelessWidget {
//   const PageMainAnimation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hero Animation'),
//         backgroundColor: Colors.green,
//       ),
//
//       body: GestureDetector(
//         child: Hero(
//           tag: 'imageHero',
//           child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYZVN3-uMdk1V8piSSsXDIJ5EjfbbsjoJQqQ&s')),
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (_){
//             return const DetailHeroAnimation();
//           }));
//         },
//       ),
//     );
//   }
// }
//
// class DetailHeroAnimation extends StatelessWidget {
//   const DetailHeroAnimation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         child: Hero(tag: 'imageHero', child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYZVN3-uMdk1V8piSSsXDIJ5EjfbbsjoJQqQ&s')),
//         onTap: (){
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
// }



// class PageAlertDialog extends StatefulWidget {
//   const PageAlertDialog({super.key});
//
//   @override
//   State<PageAlertDialog> createState() => _PageAlertDialogState();
// }
//
// class _PageAlertDialogState extends State<PageAlertDialog> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void showSnackbar() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('This is a snackbar')),
//     );
//   }
//
//   void showSimpleDialog() {
//     SimpleDialog simpleDialog = SimpleDialog(
//       title: const Text('Warning'),
//       children: <Widget>[
//         SimpleDialogOption(
//           child: const Text('Jakarta'),
//           onPressed: () {
//             print("Jakarta");
//             Navigator.pop(context);
//           },
//         ),
//         SimpleDialogOption(
//           child: const Text('Padang'),
//           onPressed: () {
//             print("Padang");
//             Navigator.pop(context);
//           },
//         ),
//         SimpleDialogOption(
//           child: const Text('Close'),
//           onPressed: () {
//             Navigator.pop(context); // Tutup dialog
//           },
//         ),
//       ],
//     );
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return simpleDialog;
//       },
//     );
//   }
//
//   void showAlertDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Warning'),
//           content: const Text('Anda yakin ingin keluar?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Tutup dialog
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('Navigator Widget'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: showSimpleDialog,
//               child: const Text('Show Simple Dialog'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: showAlertDialog,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Show Alert Dialog'),
//             ),
//             const SizedBox(height: 20),
//             MaterialButton(
//               onPressed: showSnackbar,
//               color: Colors.orange,
//               textColor: Colors.white,
//               child: const Text('Show Snackbar'),
//             ),
//             MaterialButton(onPressed: (){
//               Fluttertoast.showToast(msg: 'Ini Toast',
//                 toastLength: Toast.LENGTH_LONG,
//                 gravity: ToastGravity.BOTTOM,
//                 backgroundColor: Colors.green,
//                 textColor: Colors.white
//               );
//             }, color: Colors.purple,
//               textColor: Colors.white,
//               child: const Text('Show toast'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class PageSlideWidget extends StatefulWidget {
//   const PageSlideWidget({super.key});
//
//   @override
//   State<PageSlideWidget> createState() => _PageSlideWidgetState();
// }
//
// class _PageSlideWidgetState extends State<PageSlideWidget> {
//   double drag = 1.0;
//
//   void methodDragVolume(value) {
//     setState(() {
//       drag = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: new Text('Drag Slider'),
//       ),
//
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Slider(value: drag,
//                 min: 1.0,
//                 max: 10.0,
//
//                 onChanged: (double val) {
//                   methodDragVolume(val);
//                 }),
//
//             new Text('value : $drag')
//           ],
//         ),
//       ),
//     );
//   }
// }


// class PageButton extends StatelessWidget {
//   const PageButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Button'),
//       ),
//       body: Column(
//         children: <Widget>[
//           ElevatedButton(
//             onPressed: () {},
//             child: const Text('Elevated Button'),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: const Text('Text Button'),
//           ),
//           MaterialButton(
//             onPressed: () {},
//             color: Colors.green,
//             textColor: Colors.white,
//             child: const Text('Material Button'),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class PageInputWidget extends StatefulWidget {
//   const PageInputWidget({super.key});
//
//   @override
//   State<PageInputWidget> createState() => _PageInputWidgetState();
// }
//
// class _PageInputWidgetState extends State<PageInputWidget> {
//   String txt = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: new Text('Page Input Widget'),
//       ),
//
//       body: new Column(
//         children: <Widget>[
//           new TextField(
//             onChanged: (String text){
//               setState(() {
//                 txt = text;
//               });
//             },
//             decoration: new InputDecoration(hintText: 'Ingat Username',
//               labelText: 'username'
//             ),
//
//           ),
//
//           new Text(txt),
//         ],
//       ),
//     );
//   }
// }


// class PageTabBar extends StatefulWidget {
//   const PageTabBar({super.key});
//
//   @override
//   State<PageTabBar> createState() => _PageTabBarState();
// }
//
// class _PageTabBarState extends State<PageTabBar> with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tab Bar Apps'),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: const <Widget>[
//             Tab(icon: Icon(Icons.home)),
//             Tab(icon: Icon(Icons.dashboard)),
//             Tab(icon: Icon(Icons.data_usage)),
//             Tab(icon: Icon(Icons.close)),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: const <Widget>[
//           Center(child: Text('Welcome Home')),
//           Center(child: Text('Welcome Dashboard')),
//           Center(child: Text('Welcome Data Usage')),
//           Center(child: Text('Welcome Close')),
//         ],
//       ),
//     );
//   }
// }

// class PageGridView extends StatefulWidget {
//   const PageGridView({super.key});
//
//   @override
//   State<PageGridView> createState() => _PageGridViewState();
// }
//
// class _PageGridViewState extends State<PageGridView> {
//   List<int> itemGrid = [];
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < 30; i++) {
//       itemGrid.add(i);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page Grid View'),
//         backgroundColor: Colors.yellow,
//         titleSpacing: 80.0,
//         elevation: 35.0,
//         // toolbarOpacity: 0.5,
//         actions: <Widget>[
//           new IconButton(icon: Icon(Icons.menu), onPressed: (){}),
//           new IconButton(icon: Icon(Icons.data_usage), onPressed: (){}),
//         ],
//       ),
//       body: GridView.builder(
//         itemCount: itemGrid.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             color: Colors.green,
//             child: Padding(
//               padding: const EdgeInsets.all(25),
//               child: Center(
//                 child: Text(
//                   'Item $index',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// class PageListWidget extends StatefulWidget {
//   const PageListWidget({super.key});
//
//   @override
//   State<PageListWidget> createState() => _PageListWidgetState();
// }
//
// class _PageListWidgetState extends State<PageListWidget> {
//   List<int> item = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     for (int i = 0; i < 25; i++) {
//       item.add(i);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: item.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text('Item Nomor : $index'),
//             trailing: const Icon(Icons.print),
//           );
//         },
//       ),
//     );
//   }
// }


// class PageList extends StatelessWidget {
//   const PageList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new ListView(
//         children: <Widget>[
//           new ListTile(
//             title: Text('Rendang'),
//             trailing: Icon(Icons.fastfood),
//           ),
//           new ListTile(
//             title: Text('minuman'),
//             trailing: Icon(Icons.local_drink),
//           ),
//           new ListTile(
//             title: Text('phone'),
//             trailing: Icon(Icons.phone),
//           ),
//           new ListTile(
//             title: Text('Camera'),
//             trailing: Icon(Icons.camera_alt),
//           ),
//           new ListTile(
//             title: Text('Alarm'),
//             trailing: Icon(Icons.alarm),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class PageRowColumn extends StatelessWidget {
//   const PageRowColumn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new Text('This'),
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text('This'),
//               new Text('is'),
//               new Text('Column'),
//             ],
//           ),
//           new Text('Row')
//         ],
//       ),
//     );
//   }
// }


// class PageWidgetContainer extends StatelessWidget {
//   const PageWidgetContainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Container(
//         color: Colors.black,
//         child: new Text('My Container'),
//         width: 300.0,
//         height: 500.0,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(20),
//         foregroundDecoration: new BoxDecoration(
//           color: Colors.lightGreen
//         ),
//       ),
//     );
//   }
// }


// class PageUtama extends StatelessWidget {
//   const PageUtama({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Center(
//         child: Column(
//           children: <Widget>[
//             new MaterialButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> PagePertama()));
//
//                 }, child: Text('Page Pertama'),
//               color: Colors.lightGreen,
//               textColor: Colors.white,
//             ),
//             new MaterialButton(
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> PageKedua()));
//
//               }, child: Text('Page kedua'),
//               color: Colors.red,
//               textColor: Colors.white,
//             ),
//             new MaterialButton(
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> PageKetiga()));
//
//               }, child: Text('Page Ketiga'),
//               color: Colors.yellow,
//               textColor: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PagePertama extends StatelessWidget {
//   const PagePertama({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Center(
//         child: Text('Page Pertama'),
//       )
//     );
//   }
// }
//
// class PageKedua extends StatelessWidget {
//   const PageKedua({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Center(
//         child: Text('Page Kedua'),
//       ),
//     );
//   }
// }


// class PageStateless extends StatelessWidget {
//   const PageStateless({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Container(
//         color:Colors.blueAccent,
//         child: new Container(
//           color: Colors.lightGreen,
//           margin: const EdgeInsets.all(50.0),
//         ),
//       ),
//     );
//   }
// }

// class PageStateFull extends StatefulWidget {
//   const PageStateFull({super.key});
//
//   @override
//   State<PageStateFull> createState() => _PageStateFullState();
// }
//
// class _PageStateFullState extends State<PageStateFull> {
//
//   late String teks = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     teks = 'Klik tombol ini';
//   }
//
//   void methodChange(){
//     setState(() {
//       teks = 'Teks telah berubah';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Center(
//         child: new MaterialButton(
//             color: Colors.green,
//           textColor: Colors.white,
//           onPressed: (){
//               methodChange();
//           }, child: Text(teks),),
//       ),
//     );
//   }
// }
//

