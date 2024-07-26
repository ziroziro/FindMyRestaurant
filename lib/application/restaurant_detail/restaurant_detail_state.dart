part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable{
  const RestaurantDetailState();

  @override
  List<Object?> get props => [];
}

final class RestaurantDetailInitial extends RestaurantDetailState {}
final class RestaurantDetailLoading extends RestaurantDetailState {}
final class RestaurantDetailSuccess extends RestaurantDetailState {
  final Restaurant restaurant;
  final Detail detailRestaurant;

  const RestaurantDetailSuccess(this.restaurant, this.detailRestaurant);
}
final class RestaurantDetailFailure extends RestaurantDetailState {}
