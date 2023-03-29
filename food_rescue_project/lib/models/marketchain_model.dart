class MarketChain {
  final String market_chain_name;

  const MarketChain({
    required this.market_chain_name
  });

  factory MarketChain.fromJson(Map<String, dynamic> json) => MarketChain(
    market_chain_name: json['market_chain_name']
  );

  Map<String, dynamic> toJson() => {
    'market_chain_name': market_chain_name
  };
}