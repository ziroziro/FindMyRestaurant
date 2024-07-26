import 'package:http/http.dart' as http;

import '../domain/restaurant_detail_model.dart';
import '../domain/restaurant_list_model.dart';
import '../domain/restaurant_search_model.dart';

class ApiService {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev/";
  static const String baseUrlImage = "${_baseUrl}images/";

  Future<RestaurantList> getListData() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return restaurantListFromJson(response.body);
    } else {
      throw Exception('Failed Load List Restaurant');
    }
  }

  Future<RestaurantDetail> getDetailData(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
    if (response.statusCode == 200) {
      return restaurantDetailFromJson(response.body);
    } else {
      throw Exception('Failed Load Restaurant');
    }
  }

  Future<RestaurantSearch> getSearchData(String query) async {
    var uri = Uri.parse("$_baseUrl/search")
        .replace(queryParameters: <String, String>{'q': query});
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return restaurantSearchFromJson(response.body);
    } else {
      throw Exception('Failed Load Search List Restaurant');
    }
  }
}
