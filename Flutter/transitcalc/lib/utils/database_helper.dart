import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transitcalc/models/event.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  final StreamController<List<Event>> _eventStreamController =
      StreamController.broadcast();

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb('event_database.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Events (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            speaker TEXT,
            date INTEGER,        
            subject TEXT,
            avatar TEXT,
            type TEXT
          )
        ''');
      },
    );
  }

  // Retourne un stream pour écouter les changements en temps réel
  Stream<List<Event>> get eventsStream async* {
    yield await listAllEvents(); // Envoie les données existantes au démarrage
    yield* _eventStreamController.stream;
  }

  Future<List<Event>> listAllEvents() async {
    final db = await database;
    final result = await db.query('Events');
    return result.map((json) => Event.fromMap(json)).toList();
  }

  Future<void> insertEvent(Event event) async {
    final db = await database;
    await db.insert(
      'Events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _eventStreamController.add(await listAllEvents()); // Met à jour le Stream
  }

  Future<void> updateEvent(Event event) async {
    final db = await database;
    await db.update(
      'Events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
    _eventStreamController.add(await listAllEvents()); // Met à jour le Stream
  }

  Future<void> deleteEvent(int id) async {
    final db = await instance.database;
    await db.delete(
      'Events',
      where: 'id = ?',
      whereArgs: [id],
    );
    _eventStreamController.add(await listAllEvents()); // Met à jour le Stream
  }

  Future<void> close() async {
    _eventStreamController.close();
  }

  // Future<void> initializeEvents() async {
  //   List<Event> eventsToAdd = [
  //     Event(eventname: 'John', email: 'john@example.com'),
  //     Event(eventname: 'Jane', email: 'jane@example.com'),
  //     Event(eventname: 'Alice', email: 'alice@example.com'),
  //     Event(eventname: 'Bob', email: 'bob@example.com'),
  //   ];

  //   for (Event event in eventsToAdd) {
  //     await insertEvent(event);
  //   }
  // }
}
