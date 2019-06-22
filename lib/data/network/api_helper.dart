import 'package:friendlist/data/model/person_response.dart';
import 'package:friendlist/data/network/api_endpoint.dart';
import 'package:core/data/network_helper.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  Future<PersonResponse> getPersons() async {
    try {
      final responseJson = await NetworkHelper.clientCrud().get(ApiEndpoint.person);
      final response = PersonResponse.fromJson(responseJson.data);
      return response;
    } on DioError catch(error){
      NetworkHelper.errorHandle(error);
    }
  }
}