import 'package:get/get.dart';

import 'package:farsight_vendor_app/utils/getx_network_manager.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}
