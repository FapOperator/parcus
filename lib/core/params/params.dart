class NoParams {}

class InfoCarParams {
  final String? vinCode;
  final String auctionName;
  final String? auctionNumber;

  InfoCarParams(
      {required this.vinCode,
      required this.auctionNumber,
      required this.auctionName});
}
