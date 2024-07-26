part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable{
  const RestaurantState();

  @override
  List<Object?> get props => [];
}

final class RestaurantInitial extends RestaurantState {}
final class RestaurantLoading extends RestaurantState {}
final class RestaurantSuccess extends RestaurantState {
  final List<Restaurant> listRestaurant;

  const RestaurantSuccess(this.listRestaurant);
}
final class RestaurantFailure extends RestaurantState {}
final class RestaurantEmptyData extends RestaurantState {}
