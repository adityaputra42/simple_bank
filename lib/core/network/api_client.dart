import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import 'api_response_data.dart';

class ApiClient {
  final String _baseUrl = "Environment.getApiBaseUrl();";
  final String? appVersion = " Environment.getApiAppVersion();";
  Map<String, String>? headers;
  // ErrorController errorController = ErrorController();

  Future<ApiResponseData> get(String url, {bool isPublic = false}) async {
    ApiResponseData responseJson;
    String uri = "";
    if (isPublic) {
      uri = '$_baseUrl/$url';
    } else {
      uri = _baseUrl + appVersion! + url;
    }

    try {
      final response = await http.get(
          Uri.parse(
            uri,
          ),
          headers: headers);

      log("URL : $uri");
      log("Header : $headers");

      // if (response.statusCode < 200 && response.statusCode >= 400) {
      //   errorController.handleError(response.body);
      // }

      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }

    return responseJson;
  }

  Future<ApiResponseData> post(String url, dynamic body,
      {bool isLogin = false}) async {
    ApiResponseData responseJson;

    log("URL : ${_baseUrl + appVersion! + url}");
    log("HEADER : $headers");

    try {
      final response = await http.post(
          Uri.parse(
            _baseUrl + appVersion! + url,
          ),
          body: jsonEncode(body),
          headers: headers);
      log("Response : ${response.body}");

      // if (response.statusCode < 200 && response.statusCode >= 400) {
      //   errorController.handleError(response.body);
      // }

      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }

  Future<ApiResponseData> patch(String url, dynamic body) async {
    ApiResponseData responseJson;
    try {
      log("body : ${jsonEncode(body)}");

      final response = await http.patch(Uri.parse(_baseUrl + appVersion! + url),
          body: jsonEncode(body), headers: headers);

      // if (response.statusCode < 200 && response.statusCode >= 400) {
      //   errorController.handleError(response.body);
      // }

      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }

  Future<ApiResponseData> put(String url, dynamic body) async {
    ApiResponseData responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + appVersion! + url),
          body: jsonEncode(body), headers: headers);

      log("URL : ${_baseUrl + appVersion! + url}");

      // if (response.statusCode < 200 && response.statusCode >= 400) {
      //   errorController.handleError(response.body);
      // }
      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }

  Future<ApiResponseData> delete(String url) async {
    ApiResponseData responseJson;
    try {
      final response = await http.delete(
        Uri.parse(_baseUrl + appVersion! + url),
        headers: headers,
      );
      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }

  Future<ApiResponseData> deleteWithBody(String url, dynamic body) async {
    ApiResponseData responseJson;
    try {
      final response = await http.delete(
          Uri.parse(_baseUrl + appVersion! + url),
          headers: headers,
          body: body);

      // if (response.statusCode < 200 && response.statusCode >= 400) {
      //   errorController.handleError(response.body);
      // }
      responseJson = ApiResponseData(response.statusCode, response.body,
          headers: response.headers);
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }

  Future<ApiResponseData> multiPart(http.MultipartRequest request) async {
    ApiResponseData responseJson;
    try {
      final response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson =
          ApiResponseData(res.statusCode, res.body, headers: res.headers);
      // if (res.statusCode < 200 && res.statusCode >= 400) {
      //   errorController.handleError(res.body);
      // }
    } on SocketException {
      throw FetchDataException({
        'statusCode': 1,
        'errors': ['server.not.available']
      });
    } on HttpException {
      throw FetchDataException({
        'statusCode': 2,
        'errors': ['no.internet']
      });
    } on FormatException {
      throw FetchDataException({
        'statusCode': 3,
        'errors': ['server.error']
      });
    }
    return responseJson;
  }
}
