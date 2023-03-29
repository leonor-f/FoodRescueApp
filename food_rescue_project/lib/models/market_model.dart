class Market {
  final String maket_name;
  final String market_chain_name;
  final double market_latitude;
  final double market_longitude;
  final bool is_favorite;
  final String store_image;

  const Market ({
    required this.maket_name,
    required this.market_chain_name,
    required this.market_latitude,
    required this.market_longitude,
    required this.is_favorite,
    required this.store_image,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    maket_name: json['maket_name'],
    market_chain_name: json['market_chain_name'],
    market_latitude: json['market_latitude'],
    market_longitude: json['market_longitude'],
    is_favorite: json['is_favorite'],
    store_image: json['store_image']
  );

  Map<String, dynamic> toJson() => {
    'maket_name': maket_name,
    'market_chain_name': market_chain_name,
    'market_latitude': market_latitude,
    'market_longitude': market_longitude,
    'is_favorite': is_favorite,
    'store_image': store_image
  };
}