import 'package:equatable/equatable.dart';

abstract class IClientHttp {
  Future<HttpResponse> get({required String url});
}

class HttpResponse extends Equatable {
  final dynamic data;
  final int? statusCode;

  const HttpResponse({required this.data, required this.statusCode});

  @override
  List<Object?> get props => [data, statusCode];
}
