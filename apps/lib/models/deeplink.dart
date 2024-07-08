class Deeplink {}

class ShareDeepLink extends Deeplink {
  final String shareId;

  ShareDeepLink(this.shareId);

  @override
  String toString() => "shareId=$shareId";
}
