
class Source{

  final String status;
  final List<Sources> sources;

  Source(this.status, this.sources);

}


class Sources{

  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Sources(
      this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country
      );



}