import 'dart:convert';

import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteAdviceDataSource {
  ///requests random advice from API
  ///returns [AdviceModel] if successful
  ///Throws a server Exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class RemoteAdviceDataSourceImpl implements RemoteAdviceDataSource {
  final http.Client client;
  RemoteAdviceDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'content-type': 'application/json'});
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
