class TagModel {
  String? id;
  String? name;
  String? slug;
  int? quoteCount;
  String? dateAdded;
  String? dateModified;

  TagModel({
    this.id,
    this.name,
    this.slug,
    this.quoteCount,
    this.dateAdded,
    this.dateModified,
  });

  @override
  String toString() {
    return 'TagModel(id: $id, name: $name, slug: $slug, quoteCount: $quoteCount, dateAdded: $dateAdded, dateModified: $dateModified)';
  }

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        quoteCount: json['quoteCount'] as int?,
        dateAdded: json['dateAdded'] as String?,
        dateModified: json['dateModified'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'quoteCount': quoteCount,
        'dateAdded': dateAdded,
        'dateModified': dateModified,
      };
}
