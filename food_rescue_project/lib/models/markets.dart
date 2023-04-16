final String tableMarkets = 'markets';

class MarketsFields {
  static final List<String> values = [
    id,
    market_chain_name,
    market_name,
    market_latitude,
    market_longitude,
    is_favorite,
    store_image
  ];

  static final String id = '_id';
  static final String market_chain_name = 'market_chain_name';
  static final String market_name = 'market_name';
  static final String market_latitude = 'market_latitude';
  static final String market_longitude = 'market_longitude';
  static final String is_favorite = 'is_favorite';
  static final String store_image = 'store_image';
}

class Market {
  final int? id;
  final String market_chain_name;
  final String market_name;
  final double market_latitude;
  final double market_longitude;
  final String is_favorite;
  final String store_image;

  const Market({
    this.id,
    required this.market_chain_name,
    required this.market_name,
    required this.market_latitude,
    required this.market_longitude,
    required this.is_favorite,
    required this.store_image,
  });

  Market copy({
    int? id,
    String? market_chain_name,
    String? market_name,
    double? market_latitude,
    double? market_longitude,
    String? is_favorite,
    String? store_image,
  }) =>
      Market(
        id: id ?? this.id,
        market_chain_name: market_chain_name ?? this.market_chain_name,
        market_name: market_name ?? this.market_name,
        market_latitude: market_latitude ?? this.market_latitude,
        market_longitude: market_longitude ?? this.market_longitude,
        is_favorite: is_favorite ?? this.is_favorite,
        store_image: store_image ?? this.store_image,
      );

  static Market fromJson(Map<String, Object?> json) => Market(
        id: json[MarketsFields.id] as int?,
        market_chain_name: json[MarketsFields.market_chain_name] as String,
        market_name: json[MarketsFields.market_name] as String,
        market_latitude: json[MarketsFields.market_latitude] as double,
        market_longitude: json[MarketsFields.market_longitude] as double,
        is_favorite: json[MarketsFields.is_favorite] as String,
        store_image: json[MarketsFields.store_image] as String,
      );

  Map<String, Object?> toJson() => {
        MarketsFields.id: id,
        MarketsFields.market_chain_name: market_chain_name,
        MarketsFields.market_name: market_name,
        MarketsFields.market_latitude: market_latitude,
        MarketsFields.market_longitude: market_longitude,
        MarketsFields.is_favorite: is_favorite,
        MarketsFields.store_image: store_image
      };
}
