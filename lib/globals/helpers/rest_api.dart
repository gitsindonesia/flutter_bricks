import 'dart:convert';

import 'package:flutter_bricks/globals/exception.dart';
import 'package:http/http.dart';

class RestAPI {

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
