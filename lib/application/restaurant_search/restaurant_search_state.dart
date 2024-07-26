part of 'restaurant_search_bloc.dart';

sealed class RestaurantSearchState extends Equatable{
  const RestaurantSearchState();

  @override
  List<Object?> get props => [];
}

final class RestaurantSearchInitial extends RestaurantSearchState {}
final class RestaurantSearchLoading extends RestaurantSearchState {}
final class RestaurantSearchSuccess extends RestaurantSearchState {
  final List<Restaurant> listRestaurant;

  const RestaurantSearchSuccess(this.listRestaurant);
}
final class RestaurantSearchFailure extends RestaurantSearchState {}
final class RestaurantSearchEmptyData extends RestaurantSearchState {}
