import 'package:get/get.dart';

class ProductDetailsImgProvider extends GetConnect {
  Future<List<dynamic>> getImg() async {
    try {
      final response =
          await get("https://www.episodate.com/api/most-popular?page=1");

      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return response.body['tv_shows'];
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
