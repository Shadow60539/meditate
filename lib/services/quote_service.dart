import 'dart:convert';

import 'package:http/http.dart';

class QuoteService {
  static final apiKey = 'a6a516dbdfmsha407d994bc42c87p1b1258jsn2a02ed2b6ceb';

  static Future<void> something() async {
    Map<String, String> headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'quotes15.p.rapidapi.com'
    };
    Response response = await get(
        'https://quotes15.p.rapidapi.com/quotes/random/',
        headers: headers);

    print(jsonDecode(response.body));
  }
}
