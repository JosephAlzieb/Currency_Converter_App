import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currenciesUrl = Uri.https(
    "free.currconv.com",
    "/api/v7/currencies",
    {"apiKey": "249038a0891d75dc786d"},
  );

  Future<List<String>> getCurrencies() async {
    http.Response response = await http.get(currenciesUrl);

    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      var list = body["results"];
      List<String> currenciesList = (list.kyes).toList();
      return currenciesList;
    }
    else {
      throw Exception("failed to connect to api");
    }
  }
}
