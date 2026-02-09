import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:transitcalc/models/event.dart';
import 'package:transitcalc/utils/database_helper.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = "physics";
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Nom Conference",
                  hintText: "Entrer le nom de la conference",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois compléter ce texte";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Nom du speaker",
                  hintText: "Entrer le nom du speaker",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois compléter ce texte";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: "physics",
                    child: Text("Physique moderne"),
                  ),
                  DropdownMenuItem(
                    value: "engineering",
                    child: Text("Ingénierie"),
                  ),
                  DropdownMenuItem(
                    value: "computer science",
                    child: Text("Informatique"),
                  ),
                  DropdownMenuItem(
                    value: "astronomy",
                    child: Text("Astronomie"),
                  ),
                  DropdownMenuItem(
                    value: "biology",
                    child: Text("Biologie"),
                  ),
                ],
                decoration: InputDecoration(border: OutlineInputBorder()),
                value: selectedConfType,
                onChanged: (value) {
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  labelText: 'Choisissez une date',
                  suffixIcon: Icon(Icons.event_note),
                  border: OutlineInputBorder(),
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                firstDate: DateTime.now(),
                validator: (value) =>
                    (value == null) ? "Veuillez entrer une date" : null,
                onChanged: (value) {
                  setState(() {
                    selectedConfDate = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final confName = confNameController.text;
                    final speakerName = speakerNameController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enregistrement en cours ...")),
                    );
                    //Pour fermer le clavier :
                    FocusScope.of(context).requestFocus(FocusNode());

                    // Enregistrement dans la base de données
                    var newEvent = Event(
                      id: DateTime.now().millisecondsSinceEpoch,
                      speaker: speakerName,
                      date: selectedConfDate,
                      subject: confName,
                      avatar: "moi.jpg",
                      type: selectedConfType,
                    );
                    await DatabaseHelper.instance.insertEvent(newEvent);
                  }
                },
                child: Text("Envoyer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
