class News {
  final Map<String, dynamic> source;
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['source'],
      json['author'],
      json['title'],
      json['description'],
      json['urlToImage'],
      json['publishedAt'],
      json['content'],
    );
  }

  News(this.source, this.author, this.title, this.description, this.urlToImage,
      this.publishedAt, this.content);
}
