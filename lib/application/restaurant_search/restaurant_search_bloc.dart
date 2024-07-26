import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_ziro/domain/restaurant_model.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';

import '../../domain/restaurant_search_model.dart';

part 'restaurant_search_event.dart';
part 'restaurant_search_state.dart';

class RestaurantSearchBloc
    extends Bloc<RestaurantSearchEvent, RestaurantSearchState> {
  final ApiService _apiService;

  RestaurantSearchBloc({required ApiService apiService})
      : _apiService = apiService,
        super(RestaurantSearchInitial()) {
    on<SearchRestaurant>(
      (event, emit) async {
        emit(RestaurantSearchLoading());
        try {
          RestaurantSearch restaurantSearch =
              await _apiService.getSearchData(event.query);
          if (restaurantSearch.error == false) {
            if (restaurantSearch.restaurants.isEmpty) {
              emit(RestaurantSearchEmptyData());
            } else {
              emit(RestaurantSearchSuccess(restaurantSearch.restaurants));
            }
          } else {
            emit(RestaurantSearchFailure());
          }
        } catch (e) {
          emit(RestaurantSearchFailure());
        }
      },
    );
  }
}
