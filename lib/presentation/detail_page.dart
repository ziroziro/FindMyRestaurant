import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/restaurant_detail/restaurant_detail_bloc.dart';
import '../infrastucture/api_service.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
            builder: (context, state) {
              if (state is RestaurantDetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RestaurantDetailSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${ApiService.baseUrlImage}medium/${state.restaurant.pictureId}",
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.restaurant.name,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18.0,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  state.restaurant.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.restaurant.city),
                                const SizedBox(height: 5.0),
                                Text(state.detailRestaurant.address),
                              ],
                            ),
                          ],
                        ),
                      ),
                            
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.detailRestaurant.categories.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(state
                                      .detailRestaurant.categories[index].name),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          state.restaurant.description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Foods",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.detailRestaurant.menu.foods.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(state
                                      .detailRestaurant.menu.foods[index].name),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Drink",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.detailRestaurant.menu.drinks.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(state.detailRestaurant.menu
                                      .drinks[index].name),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is RestaurantDetailFailure) {
                return const Center(child: Text('Data cant load'));
              } else {
                return Container();
              }
            },
          ),
          Positioned(
            top: 35,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.amber,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
