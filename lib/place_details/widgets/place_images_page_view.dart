import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_challenge/models/models.dart';

class PlaceImagesPageView extends StatelessWidget {
  const PlaceImagesPageView({
    Key? key,
    required this.imagesUrl,
    required this.place,
  }) : super(key: key);

  final List<String> imagesUrl;
  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: imagesUrl.length,
            controller: PageController(viewportFraction: .9),
            itemBuilder: (context, index) {
              final imageUrl = place.imagesUrl[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(imageUrl),
                    colorFilter: const ColorFilter.mode(
                      Colors.black26,
                      BlendMode.darken,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagesUrl.length,
            (index) => Container(
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 3,
              width: 10,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
