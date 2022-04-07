import 'dart:async';

import 'package:http/http.dart' as http;
 Future<http.Response> fetchDelivery() {
   Uri uri = Uri.parse('http://192.168.0.105:8083/delivery/');
   return http.get(uri);
 }
