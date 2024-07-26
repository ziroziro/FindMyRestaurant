import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_ziro/domain/restaurant_model.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';

import '../../domain/restaurant_detail_model.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  final ApiService _apiService;

  RestaurantDetailBloc({required ApiService apiService})
      : _apiService = apiService,
        super(RestaurantDetailInitial()) {
    on<DetailRestaurant>(
      (event, emit) async {
        emit(RestaurantDetailLoading());
        try {
          RestaurantDetail restaurantDetail =
              await _apiService.getDetailData(event.idPost);
          if (restaurantDetail.error == false) {
            emit(RestaurantDetailSuccess(
                restaurantDetail.restaurant, restaurantDetail.detail));
          } else {
            emit(RestaurantDetailFailure());
          }
        } catch (e) {
          emit(RestaurantDetailFailure());
        }
      },
    );
  }
}
