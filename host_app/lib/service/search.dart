import 'dart:convert' as convert;

import 'package:host_app/api/api_endpoints.dart';
import 'package:host_app/model/address.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger();

class SearchService {
  const SearchService();

  Future<Address?> queryCEP(String value) async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.cep(value)));

      if (response.statusCode != 200) {
        throw Error.safeToString("🔍 Search Service - ❌ Query CEP error");
      }

      logger.d("🔍 Search Service - ✅ Query CEP: \n\n${response.body}");

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Address.fromJson(jsonResponse);
    } catch (error) {
      logger.e(error);
      return null;
    }
  }
}
