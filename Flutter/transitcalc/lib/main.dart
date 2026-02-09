import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:transitcalc/pages/add_event_page.dart';
import 'package:transitcalc/pages/event_page.dart';
import 'package:transitcalc/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialisation pour Windows / Linux / macOS
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0;

  setCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransitCalc',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            [
              "TransitCalc App - Home",
              "TransitCalc App - Conféreces",
              "TransitCalc App - Formulaire",
            ][_currentPageIndex],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: const Color.fromARGB(255, 21, 115, 193),
        ),
        body: [
          HomePage(),
          EventPage(),
          AddEventPage(),
        ][_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) => setCurrentPageIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          iconSize: 32,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Planning",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Ajout",
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.primaries[index % Colors.primaries.length],
          height: 100,
          child: Text(
            "Elément ${index + 1}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              decoration: TextDecoration.none,
            ),
          ),
        );
      },
    );
  }
}
