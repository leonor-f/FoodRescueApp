class Location {
  final double latitude;
  final double longitude;

  const Location({
    required this.latitude,
    required this.longitude
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json['latitude'],
    longitude: json['longitude'],
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude
  };
}