import 'dart:io';

class ApiConstants {
  static const url = 'https://finance.buclib.club/api/v1';
  // static const url = 'http://localhost:3000/api/v1';
  static Map<String, String> authHeader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };
}
