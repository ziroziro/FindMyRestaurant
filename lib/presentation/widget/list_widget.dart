import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_ziro/application/restaurant_detail/restaurant_detail_bloc.dart';
import 'package:restaurant_ziro/domain/restaurant_model.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';

import '../detail_page.dart';

class ListWidget extends StatelessWidget {
  final List<Restaurant> listRestaurant;
  const ListWidget({
    super.key,
    required this.listRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRestaurant.length,
      itemBuilder: (BuildContext context, int index) {
        var restaurant = listRestaurant[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) =>
                    RestaurantDetailBloc(apiService: ApiService())
                      ..add(DetailRestaurant(restaurant.id)),
                child: const DetailPage(),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: Card(
              elevation: 3,
              key: ValueKey(restaurant.id),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "${ApiService.baseUrlImage}medium/${restaurant.pictureId}"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                restaurant.city,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                restaurant.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
