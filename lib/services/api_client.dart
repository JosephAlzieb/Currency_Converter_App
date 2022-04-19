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

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var list = body["results"];
      List<String> currenciesList = (list.keys).toList();
      return currenciesList;
    } else {
      throw Exception("failed to connect to api");
    }
  }

  Future<double> getRate(String from, String to) async {
    final Uri ratUrl = Uri.https(
      "free.currconv.com",
      "/api/v7/convert",
      {"apiKey":"249038a0891d75dc786d",
        "q":"${from}_${to}",
        "compact":"ultra"
      },
    );

    http.Response response = await http.get(ratUrl);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      return body["${from}_${to}"];
    }
    else{
      throw Exception("failed to connect to the api");
    }
  }
}
