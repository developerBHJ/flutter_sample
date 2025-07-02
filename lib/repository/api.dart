class Api {
  /// baseUrl
  static final String baseUrl = "https://www.wanandroid.com/";

  /// baseUrl
  static String homeList(String pageCount) {
    return "article/list/$pageCount/json";
  }

  /// homeTopList
  static final String homeTopList = "article/top/json";
}
