import 'package:dio/dio.dart';

class HttpService {
  final Dio _client = Dio();

  Dio get client => _client;
}
