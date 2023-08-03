
class Query {

  static String pageQuery(int page) => "page=$page";
  static String genreQuery(int id) => "with_genres=$id";
  static String searchQuery(String text) => "query=$text";
  static String regionQuery(String region) => "region=$region";


}