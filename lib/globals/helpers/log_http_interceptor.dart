import 'package:http_interceptor/http_interceptor.dart';

class LogHttpInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print("DO HTTP ${data.method} REQUEST ${data.url}");
    print("Request Body : ${data.body}");
    print("Request Header : ${data.headers}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print("Response Body : ${data.body}");
    print("Response Header : ${data.headers}");
    return data;
  }

}