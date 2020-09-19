import 'package:http/http.dart' as http;
import 'package:needzaio/http/url.dart';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  Future<http.Response> post() {
    return http.post(urlBase + url, body: body).timeout(Duration(seconds: 30));
  }

  Future<http.Response> get() {
    return http.get(urlBase + url).timeout(Duration(seconds: 30));
  }
}
