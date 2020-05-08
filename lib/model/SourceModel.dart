
class Sources{

  final String status;
  final List<Source> sources;

  Sources(this.status, this.sources);

  factory Sources.fromJson(Map<String, dynamic> json){
    String status = json['status'];
    List<Source> sources = [];

    var sourcesList = json['sources'] as List<dynamic>;
    for (json in sourcesList){
      var source = Source.fromJson(json);
      sources.add(source);
    }

    return Sources(status, sources);
  }

}


class Source{

  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country
      });

  factory Source.fromJson(Map<String, dynamic> json){
    String id = json['id'];
    String name = json['name'];
    String description = json['description'];
    String url = json['url'];
    String category = json['category'];
    String language = json['language'];
    String country = json['country'];

    return Source(id: id, name: name, description: description, url: url, category: category, language: language, country: country );

  }
}