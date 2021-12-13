import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app_challenge/models/models.dart';
import 'package:travel_app_challenge/place_details/widgets/place_images_page_view.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final TravelPlace place;
  final double topPercent;
  final double bottomPercent;

  @override
  Widget build(BuildContext context) {
    final imagesUrl = place.imagesUrl;
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadding) * (1 - bottomPercent),
              bottom: 160 * (1 - bottomPercent),
            ),
            child: Transform.scale(
              scale: lerpDouble(1, 1.3, bottomPercent)!,
              child: PlaceImagesPageView(imagesUrl: imagesUrl, place: place),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 140,
            color: Colors.blue.shade50,
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 70,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
