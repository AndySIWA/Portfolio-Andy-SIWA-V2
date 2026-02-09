class Event {
  final int id;
  final String speaker;
  final DateTime date;
  final String subject;
  final String avatar;
  final String? type;

  const Event({
    required this.id,
    required this.speaker,
    required this.date,
    required this.subject,
    required this.avatar,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'speaker': speaker,
      'date': date.millisecondsSinceEpoch, // Stockage en timestamp INTEGER
      'subject': subject,
      'avatar': avatar,
      'type': type
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      speaker: map['speaker'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(
          map['date'] as int), // Conversion timestamp → DateTime
      subject: map['subject'] as String,
      avatar: map['avatar'] as String,
      type: map['type'] as String,
    );
  }

  @override
  String toString() {
    return "Conference $subject à la date du $date, avec le speaker $speaker";
  }
}
