abstract class IClientHttp {
  Future<HttpResponse> get({required String url});
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
