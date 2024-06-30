import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'package:farsight_vendor_app/constants/env.dart';
import 'package:farsight_vendor_app/screens/root_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

const mode = 'STAGING';

final env = Environment(mode).getConfig();

void main() {
  runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await Future.delayed(
        const Duration(seconds: 2),
      );
      FlutterNativeSplash.remove();
      FlutterError.onError = (FlutterErrorDetails details) {
        log('Error: ${details.exceptionAsString()}', stackTrace: details.stack);
      };

      await GetStorage.init('authStorage');

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      runApp(const RootScreen());
    },
    (error, stackTrace) => log('Error: $error', stackTrace: stackTrace),
  );
}
