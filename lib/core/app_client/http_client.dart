import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:holybible/core/app_client/client_repo.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IClientHttp {
  final client = http.Client();

  final header = {
    "Authorization": dotenv.env['APIKEY']!,
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  @override
  Future<HttpResponse> get({required String url}) async {
    final response = await client.get(Uri.parse(url), headers: header);
    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
