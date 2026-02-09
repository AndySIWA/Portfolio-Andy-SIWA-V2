import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transitcalc/models/event.dart';
import 'package:transitcalc/utils/database_helper.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events0 = [
    {
      "speaker": "AndySmart",
      "date": "13 à 13h30",
      "subject": "Le traitement de photos",
      "avatar": "moi.jpg"
    },
    {
      "speaker": "Blériot",
      "date": "17h30 à 18h",
      "subject": "Les logiciels Saas",
      "avatar": "saas.png"
    },
    {
      "speaker": "Microqqtech",
      "date": "18 à 18h30",
      "subject": "Les couveuses néonatales",
      "avatar": "couveuse.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<List<Event>>(
          stream: DatabaseHelper.instance.eventsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Erreur: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("Aucun évènement existant"));
            }

            final events = snapshot.data!;

            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];

                return Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/${event.avatar}"),
                    title: Text(
                        "${event.speaker} (${DateFormat.yMd().add_jm().format(event.date)})"),
                    subtitle: Text(event.subject),
                    trailing: Icon(Icons.more_vert),
                  ),
                );
              },
            );
          }),
    );
  }
}
