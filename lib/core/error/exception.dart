import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException([this.message = 'Ocorreu um erro no servidor.']);
  @override
  List<Object?> get props => [message];
}

class NetworkException extends Equatable implements Exception {
  final String message;
  const NetworkException([this.message = 'Falha ao conectar-se à rede.']);

  @override
  List<Object?> get props => [message];
}

class HttpErrorException extends Equatable implements Exception {
  final String data;
  final int? statusCode;
  const HttpErrorException({this.statusCode, required this.data});

  @override
  List<Object?> get props => [data, statusCode];
}
