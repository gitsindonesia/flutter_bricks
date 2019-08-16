import 'dart:convert';

import 'package:flutter_bricks/globals/exception.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_with_interceptor.dart';

import 'log_http_interceptor.dart';

class RestAPI {

  static client() => HttpWithInterceptor.build(interceptors: [LogHttpInterceptor()]);

  static responseJSON<T>(Response response, {onHttpOk}){
    switch(response.statusCode){
      case 404:
        throw Exception("Not Found Url");
        break;
      case 400:
        throw Exception("Bad Request");
        break;
      case 401:
        throw UnAuthorizeException();
        break;
      default:
        final json = jsonDecode(response.body);
        return onHttpOk(json);
    }
  }
}
