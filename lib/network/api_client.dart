import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:ny_times/network/result.dart';

import 'log_interseptor.dart';

class ApiClient {
  ApiClient._internal();

  static final ApiClient _instance = ApiClient._internal();

  static ApiClient get instance => _instance;
  static const _baseUri = 'api.nytimes.com';

  Client _client = HttpClientWithInterceptor.build(
    interceptors: [LogInterceptor()],
    requestTimeout: Duration(seconds: 30),
  );

  Uri _encodeUrl({String path = '', Map<String, String> params}) {
    return Uri.https(_baseUri, path, params ?? {});
  }

  Future<Result> getArticles() async {
    final response = await _client.get(
      _encodeUrl(
        path: 'svc/topstories/v2/home.json',
        params: {
          'api-key':
          'sSKKPOkjEUYjLeUQ4dfvADaLDlDD40No',
        },
      ),
    ).timeout(Duration(seconds: 30), onTimeout: () {
      return null;
    });

    if (response == null) {
      return Result(isSuccess: false, error: 'Time out');
    }

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return Result(isSuccess: true, data: body);
    }
    Map body = json.decode(response.body);

    String error = '';
    body.forEach((key, value) {
      if (value is List) {
        value.forEach((element) {
          error += '$element\n';
        });
      }
      if (value is String) {
        error += '$value\n';
      }
    });
    return Result(isSuccess: false, error: error);
  }
}