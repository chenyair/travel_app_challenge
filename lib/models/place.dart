import 'package:travel_app_challenge/models/models.dart';

class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imagesUrl,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.popular,
    this.shared = 0,
    this.likes = 0,
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imagesUrl;

  static List<TravelPlace> places = [
    TravelPlace(
      id: '3',
      name: 'Riviera Maya',
      likes: 500,
      shared: 240,
      description:
          'Riviera Maya tiene mas de 120 km de costa tuquesa cristalina,'
          ' playas de arena blanca, sitios arqueologicos, parques '
          'naturales y actividades acuaticas unicas',
      user: TravelUser.alex,
      imagesUrl: [
        'https://images.unsplash.com/photo-1564852694965-94accf8e0713',
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18',
        'https://images.unsplash.com/photo-1560242374-f222add02c68'
      ],
      statusTag: StatusTag.popular,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
    TravelPlace(
      id: '1',
      name: 'Tulum',
      likes: 140,
      shared: 49,
      description:
          'Tulum fue una ciudad amurallada de la cultura maya ubicada en el '
          'Estado de Quintana Roo, en el sureste de Mexico, en la costa'
          ' del mar Caribe.',
      user: TravelUser.mario,
      imagesUrl: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674'
      ],
      statusTag: StatusTag.event,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
    TravelPlace(
      id: '3',
      name: 'Paris',
      likes: 1024,
      shared: 530,
      description: 'The most beautiful city in all of France',
      user: TravelUser.mario,
      imagesUrl: [
        'https://media.cntraveler.com/photos/5d8cf7d5db6acf000833e6cc/master/pass/Eiffel-Tower_GettyImages-1060266626.jpg',
      ],
      statusTag: StatusTag.event,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
  ];
}
