import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_ziro/application/restaurant_search/restaurant_search_bloc.dart';
import 'package:restaurant_ziro/infrastucture/api_service.dart';
import 'package:restaurant_ziro/presentation/widget/list_widget.dart';

import 'widget/empty_widget.dart';
import 'widget/loading_widget.dart';
import 'widget/search_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  SearchBarWidget _searchBarWidget = const SearchBarWidget();

  @override
  void initState() {
    _searchBarWidget = SearchBarWidget(editingController: editingController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantSearchBloc(apiService: ApiService())
        ..add(SearchRestaurant(editingController.text)),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<RestaurantSearchBloc, RestaurantSearchState>(
          builder: (context, state) {
            if (state is RestaurantSearchLoading) {
              return Column(
                children: [
                  _searchBarWidget,
                  const LoadingWidget(),
                ],
              );
            } else if (state is RestaurantSearchSuccess) {
              return Column(
                children: [
                  _searchBarWidget,
                  Expanded(
                    child: ListWidget(
                      listRestaurant: state.listRestaurant,
                    ),
                  ),
                ],
              );
            } else if (state is RestaurantSearchFailure) {
              return Column(
                children: [
                  _searchBarWidget,
                  const Text('data cant load'),
                ],
              );
            } else if (state is RestaurantSearchEmptyData) {
              return Column(
                children: [
                  _searchBarWidget,
                  const EmptyWidget(message: "data restaurant belum ada"),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
