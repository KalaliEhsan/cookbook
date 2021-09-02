import 'package:url_launcher/url_launcher.dart';

class Helper {
  static void goToWebPage(url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }
}
