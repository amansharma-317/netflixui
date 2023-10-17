import 'package:flutter/material.dart';

import '../models/selected_show.dart';

class MyGridView extends StatelessWidget {
  final List<SelectedShow> selectedShows;

  MyGridView({required this.selectedShows});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8,
        ),
        itemCount: selectedShows.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              child: Image.network(
                selectedShows[index].imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
