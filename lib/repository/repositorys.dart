import 'package:dio/dio.dart';
import 'package:BlocAPi/model/article.dart';

class Repository {
  String endpoint =
      "https://techblog.sasansafari.com/Techblog/api/article/get.php?command=new";

  Future<List<Article>> getArticles() async {
    List<Article> list = [];
    await Dio().get(endpoint).then((response) {
      if (response.statusCode == 200) {
        for (var articleJson in response.data) {
          list.add(Article.fromJson(articleJson));
        }
      }
    });
    return list;
  }
}
