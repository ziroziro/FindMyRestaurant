part of 'restaurant_search_bloc.dart';

sealed class RestaurantSearchEvent extends Equatable {
  const RestaurantSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchRestaurant extends RestaurantSearchEvent{
  final String query;
  const SearchRestaurant(this.query);

  @override
  List<Object> get props => [];
}
