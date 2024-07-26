import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/restaurant_search/restaurant_search_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? editingController;
  const SearchBarWidget({
    super.key,
    this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0, top: 20.0),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 2 / 2.85,
            child: TextField(
              controller: editingController,
              decoration: const InputDecoration(
                hintText: "Search by Name",
                contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
            ),
            onPressed: () {
              context.read<RestaurantSearchBloc>().add(
                    SearchRestaurant(editingController!.text),
                  );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
