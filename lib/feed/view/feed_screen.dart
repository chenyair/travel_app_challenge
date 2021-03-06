import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_challenge/feed/widgets/widgets.dart';
import 'package:travel_app_challenge/models/models.dart';
import 'package:travel_app_challenge/place_details/view/view.dart';
import 'package:travel_app_challenge/widgets/widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.star),
          ),
        ],
      ),
      extendBody: true,
      body: ListView.builder(
        itemCount: TravelPlace.places.length,
        itemExtent: 400,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return PlaceCard(
            place: place,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                    opacity: animation,
                    child: PlaceDetailsScreen(place: place),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: TravelNavigationBar(
        onTap: (index) {},
        items: [
          TravelNavigationBarItem(
            icon: CupertinoIcons.chat_bubble,
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2,
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          )
        ],
      ),
    );
  }
}
