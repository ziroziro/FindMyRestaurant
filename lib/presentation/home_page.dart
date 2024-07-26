import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_ziro/application/restaurant/restaurant_bloc.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';
import 'package:restaurant_ziro/presentation/widget/list_widget.dart';
import 'package:restaurant_ziro/routes.dart';

import 'widget/empty_widget.dart';
import 'widget/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantBloc(apiService: ApiService())..add(FetchListRestaurant()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 6,
          title: const Text(
            "Find My Restaurant",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, searchRestaurantPageRoute),
                child: const Icon(
                  Icons.search,
                  size: 32.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantSuccess) {
                return ListWidget(listRestaurant: state.listRestaurant);
              } else if (state is RestaurantFailure) {
                return const Center(child: Text('data cant load'));
              } else if (state is RestaurantEmptyData) {
                return const EmptyWidget(message: "data restaurant belum ada");
              } else if (state is RestaurantLoading) {
                return const LoadingWidget();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
