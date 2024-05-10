import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farsight_vendor_app/main.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:get_storage/get_storage.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:farsight_vendor_app/screens/signin_screen.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DioModule {
  final dio = Dio();
  final environment = env;

  DioModule() {
    dio.options.baseUrl = environment['baseUrl'];
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.validateStatus = (status) {
      return status! < 502;
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          GetStorage storage = GetStorage('authStorage');
          var token = await storage.read('accessToken');
          // var refreshToken = await storage.read('refreshToken');

          print(options.uri);
          options.headers['Content-Type'] = 'application/json';

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            // options.headers['x-mt-refresh'] = refreshToken;

            return handler.next(options); //continue
          }

          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          // Do something with the response
          // updateRefreshToken(response);
          if (response.statusCode == 401) {
            final GetStorage authStorage = GetStorage('authStorage');

            await authStorage.write('accessToken', null);
            // await authStorage.write('refreshToken', null);
            await authStorage.write('user', null);
            await authStorage.write('isAuth', false);

            navigator!.pushAndRemoveUntil(
              createPageRoute(const SignInScreen()),
              (route) => false,
            );

            errorNotif(
              message: response.data?['message'] ?? 'Session expired!',
            );
            return handler.next(response); // continue
          } else if (response.statusCode == 400) {
            if (response.data?['validation'] != null) {
              var validation = response.data?['validation'];
              var validationJson = jsonDecode(jsonEncode(validation));

              errorNotif(
                message: validationJson?['body']?['message'] ?? '',
              );
            } else {
              errorNotif(
                message: response.data?['message'] ?? 'Invalid request!',
              );
            }

            return handler.next(response); // continue
          } else if (response.statusCode == 403) {
            errorNotif(
              message: response.data?['message'] ?? 'Forbidden action!',
            );

            return handler.next(response); // continue
          } else if (response.statusCode == 404) {
            errorNotif(
              message: 'Failed to connect with server!',
            );

            response.data = {
              'message': 'Failed to connect with server!',
            };
            return handler.next(response); // continue
          } else if (response.statusCode == 409) {
            errorNotif(
              message: 'Validation Failed!',
            );

            response.data = {
              'message': 'Validation Failed!',
            };
            return handler.next(response); // continue
          } else if (response.statusCode == 429) {
            errorNotif(
              message: response.data?['message'] ??
                  'Too Many Requests! Try again later!',
            );

            return handler.next(response); // continue
          } else if (response.statusCode == 502) {
            errorNotif(
              message: response.data?['message'] ?? 'Something went wrong!',
            );

            return handler.next(response); // continue
          } else if (response.statusCode == 500) {
            errorNotif(
              message: response.data?['message'] ?? 'Internal server error!',
            );

            return handler.next(response); // continue
          }

          return handler.next(response); // continue
        },
        onError: (DioException error, handler) async {
          // Do something with the error
          if (error.response == null) {
            errorNotif(
              message:
                  'Something went wrong! Contact support if this issue prevails.',
            );
            return handler.next(error); // continue
          } else {
            // connection timeout
            if (error.type == DioExceptionType.connectionTimeout) {
              errorNotif(
                message:
                    'Connection timed out! Check your internet connection.',
              );
              return handler.next(error); // continue
            }

            // connection error
            if (error.type == DioExceptionType.connectionError) {
              errorNotif(
                message: 'Connection error! Check your internet connection.',
              );
              return handler.next(error); // continue
            }

            // connection refused
            if (error.error is SocketException) {
              errorNotif(
                message: 'Connection refused! Try again later.',
              );
              return handler.next(error); // continue
            }

            // receive timeout
            if (error.type == DioExceptionType.receiveTimeout) {
              errorNotif(
                message: 'Server is not responding! Try again later.',
              );
              return handler.next(error); // continue
            }
          }

          errorNotif(
            message: error.response?.data?['message'] ?? 'Unknown error!',
          );
          return handler.next(error); // continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        },
      ),
    );
  }
}

void updateRefreshToken(Response<dynamic>? response) async {
  var newAuthToken = response?.headers['x-access-token'];

  GetStorage storage = GetStorage('authStorage');
  var token = await storage.read('accessToken');

  if (newAuthToken == null && token == null) {
    return; // continue
  }
  if (newAuthToken != null && token != newAuthToken) {
    await storage.write('accessToken', newAuthToken);
  }
  return; // continue
}
