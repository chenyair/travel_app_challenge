class TravelUser {
  TravelUser(this.name, this.urlPhoto);

  final String name;
  final String urlPhoto;

  static TravelUser alex = TravelUser('Alex Fernandez',
      'https://images.unsplash.com/photo-1589304038421-449708a42983');
  static TravelUser mario =
      TravelUser('Mario Calzada', 'https://i.ibb.co/c1j1VDT/yo.jpg');
}

enum StatusTag { popular, event }
