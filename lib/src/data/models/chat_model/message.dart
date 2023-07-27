class Message {
  int? id;
  int? useridfrom;
  String? text;
  int? timecreated;

  Message({this.id, this.useridfrom, this.text, this.timecreated});

  @override
  String toString() {
    return 'Message(id: $id, useridfrom: $useridfrom, text: $text, timecreated: $timecreated)';
  }

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'] as int?,
        useridfrom: json['useridfrom'] as int?,
        text: json['text'] as String?,
        timecreated: json['timecreated'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'useridfrom': useridfrom,
        'text': text,
        'timecreated': timecreated,
      };
}
