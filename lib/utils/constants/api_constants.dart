import 'dart:io';

class ApiConstants {
  static const url = 'https://finance.buclib.club/api/v1';
  static Map<String, String> authHeader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };
}
