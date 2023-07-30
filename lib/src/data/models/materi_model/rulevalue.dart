class Rulevalue {
  int? status;
  String? description;

  Rulevalue({this.status, this.description});

  @override
  String toString() {
    return 'Rulevalue(status: $status, description: $description)';
  }

  factory Rulevalue.fromJson(Map<String, dynamic> json) => Rulevalue(
        status: json['status'] as int?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'description': description,
      };
}
