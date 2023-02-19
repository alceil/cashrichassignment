class Cmcmodel {
  final String? name;
  final String? symbol;
  final int? cmcRank;
  final double? price;
  final double? percentageChange;

  Cmcmodel({
    required this.name,
    required this.symbol,
    required this.cmcRank,
    required this.price,
    required this.percentageChange,
  });

  static Cmcmodel convert(Map data) => Cmcmodel(
      name: data['name']??'',
      symbol: data['symbol']??'',
      cmcRank: data['cmc_rank'],
      price:  data['quote']?['USD']?['price'],
      percentageChange: data['quote']?['USD']?['percent_change_24h']

      );
}
