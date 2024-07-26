import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_ziro/domain/restaurant_list_model.dart';
import 'package:restaurant_ziro/domain/restaurant_model.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final ApiService _apiService;

  RestaurantBloc({required ApiService apiService})
      : _apiService = apiService,
        super(RestaurantInitial()) {
    on<FetchListRestaurant>(
      (event, emit) async {
        emit(RestaurantLoading());
        try {
          RestaurantList restaurantList = await _apiService.getListData();
          if (restaurantList.error == false) {
            if (restaurantList.restaurant.isEmpty) {
              emit(RestaurantEmptyData());
            } else {
              emit(RestaurantSuccess(restaurantList.restaurant));
            }
          } else {
            emit(RestaurantFailure());
          }
        } catch (e) {
          emit(RestaurantFailure());
        }
      },
    );
  }
}
