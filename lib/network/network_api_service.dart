import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../network/app_exceptions.dart';
import '../network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      print("Request URL: $url");
      print("Request Data: ${jsonEncode(data)}");

      Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      responseJson = returnResponse(response);
    } on SocketException {
      print("No internet connection");
      throw FetchDataException("No internet connection");
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);

    return responseBody;
  }
}
