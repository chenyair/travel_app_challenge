import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_challenge/core/context_theme.dart';
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
          child: TranslateAniamtion(
            child: _LikesAndSharesContainer(place: place),
          ),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAniamtion(
            child: _UserInfoContainer(place: place),
          ),
        ),
      ],
    );
  }
}

class TranslateAniamtion extends StatelessWidget {
  const TranslateAniamtion({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(0, 100 * value), child: child!);
      },
      child: child,
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(place.user.urlPhoto),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.user.name,
                style: context.bodyText1,
              ),
              Text(
                'yesterday at 9:10 p.m.',
                style: context.bodyText1.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            child: const Text("+Follow"),
          ),
        ],
      ),
    );
  }
}

class _LikesAndSharesContainer extends StatelessWidget {
  const _LikesAndSharesContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(
              CupertinoIcons.heart,
              size: 26,
            ),
            label: Text(
              place.likes.toString(),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(
              CupertinoIcons.reply,
              size: 26,
            ),
            label: Text(
              place.shared.toString(),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              primary: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            icon: const Icon(
              Icons.check_circle_outline,
              size: 26,
            ),
            label: const Text("Checkin"),
          ),
        ],
      ),
    );
  }
}
