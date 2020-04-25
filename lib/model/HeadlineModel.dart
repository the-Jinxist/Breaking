
class HeadlineModel{

  final String status;
  final int totalResults;
  final List<Article> articles;

  HeadlineModel(this.status, this.totalResults, this.articles);

  factory HeadlineModel.fromJson(Map<String, dynamic> json){
    List<Article> articles = [];
    
    String status = json["status"];
    int totalResults = json["totalResults"];
    var articlesList  = json["articles"] as List<dynamic>;
    for (json in articlesList){

      String id = json["source"]["id"];
      String name = json["source"]["name"];

      String author = json["author"];
      String title = json["title"];
      String description = json["description"];
      String url = json["url"];
      String urlToImage = json["urlToImage"];
      String publishedAt = json["publishedAt"];
      String content = json["content"];

      Source source = Source(id, name);
      var article = Article(source, author, title, description, url, urlToImage, publishedAt, content);

      articles.add(article);
    }

    print(articles[3].description);

    return HeadlineModel(status, totalResults, articles);
  }

}

class Article{

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(this.source, this.author, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content);

  Map<String, dynamic> toJson(){
    var json = Map<String, dynamic>();

    json["sourceName"] = source.name;
    json["url"] = url;
    json["urlToImage"] = urlToImage;
    json["title"] = title;
    json["description"] = description;

    return json;
  }

}

class Source{

  String id;
  String name;

  Source(this.id, this.name);

}