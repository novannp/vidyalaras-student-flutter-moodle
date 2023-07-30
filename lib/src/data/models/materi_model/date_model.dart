class DateModel {
  final String? label;
  final int? timestamp;

  DateModel(this.label, this.timestamp);

  DateModel.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?,
        timestamp = json['timestamp'] as int?;
}
