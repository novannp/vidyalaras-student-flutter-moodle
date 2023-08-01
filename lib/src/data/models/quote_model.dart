class QuoteModel {
  String? id;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuoteModel({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  @override
  String toString() {
    return 'QuoteModel(id: $id, author: $author, content: $content, tags: $tags, authorSlug: $authorSlug, length: $length, dateAdded: $dateAdded, dateModified: $dateModified)';
  }

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['_id'] as String?,
        author: json['author'] as String?,
        content: json['content'] as String?,
        tags: json['tags'] as List<String>?,
        authorSlug: json['authorSlug'] as String?,
        length: json['length'] as int?,
        dateAdded: json['dateAdded'] as String?,
        dateModified: json['dateModified'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'author': author,
        'content': content,
        'tags': tags,
        'authorSlug': authorSlug,
        'length': length,
        'dateAdded': dateAdded,
        'dateModified': dateModified,
      };
}
