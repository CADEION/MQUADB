import 'dart:convert';

import 'package:mquadb/data/datasources/remote/api_client.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/home/home_model.dart';
import '../datasources/remote/api_endpoint.dart';
import '../models/home_list.dart';

class SearchRepo extends ApiClient {
  
  Future<List<HomeModel>> getAllSearchPosts(String query) async {
    try {
      final response = await getRequest(path: '$ApiEndpoint$query');
      if (response.statusCode == 200) {
        // final responseData = tagsModelFromJson(jsonEncode(response.data));
        List<HomeModel> responseData = homeModelFromJson(jsonEncode(response.data));
        // final responseData = HomeModel.fromJson(response.data);
        return responseData;
      } else {
        return HomeList.homeCharList;
      }
    } on Exception catch (e) {
      Vx.log(e);
      return HomeList.homeCharList;
    }
  }
}