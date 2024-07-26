part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();

  @override
  List<Object?> get props => [];
}

class DetailRestaurant extends RestaurantDetailEvent{
  final String idPost;
  const DetailRestaurant(this.idPost);

  @override
  List<Object> get props => [];
}
