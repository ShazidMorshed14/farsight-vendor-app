import 'package:farsight_vendor_app/service/network_handler/network_handler.dart';
import 'package:get/get.dart';

class LandingPageController extends GetxController {
  RxString? token;
  RxBool loggedIn = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    // ignore: unused_local_variable
    var scopedToken = await NetworkHandler.getToken();

    if (scopedToken != null) {
      token?.value = scopedToken;
      loggedIn.value = true;

      var response =
          await NetworkHandler.get("vendor/user/vendor-details", scopedToken);
      print(response);
    }
  }
}
