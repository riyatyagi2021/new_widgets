import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:trying_widgetss/new_trials/dropdown_country_api/repo.dart';

Future<List<CountryListModal>> getSWData() async {


  http.Response response = await http.get(
    Uri.parse('https://api.countrystatecity.in/v1/countries'),
    headers: {
      'X-CSCAPI-KEY': "dUdVUFc5R21XZmJZR3QyQUNFQkFWbTBDMHBNQUFRQ0FwZTNWMUdveg==",
    },
  ); if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    log('get profile======>>>>>  $data');
    //  CountryListModal apiResponse = CountryListModal.fromJson(data);
    return data
        .map<CountryListModal>((item) => CountryListModal.fromJson(item))
        .toList()
    ;
  } else {
    throw Exception('Failed to load country');
  }

}