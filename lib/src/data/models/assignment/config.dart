class Config {
  String? plugin;
  String? subtype;
  String? name;
  String? value;

  Config({this.plugin, this.subtype, this.name, this.value});

  Config.fromJson(Map<String, dynamic> json) {
    plugin = json['plugin'];
    subtype = json['subtype'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plugin'] = plugin;
    data['subtype'] = subtype;
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
