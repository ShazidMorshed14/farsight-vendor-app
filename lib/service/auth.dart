import 'package:get_storage/get_storage.dart';
import 'package:farsight_vendor_app/model/user.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<User> signin(
    {required String identifier, required String password}) async {
  Map<String, dynamic> body = {
    'identifier': '+88' + identifier,
    'password': password,
  };

  print(body);

  var response = await postRequest(
    uri: '/vendor/auth/signin',
    body: body,
  );

  if (response?['status'] == 200) {
    var data = response?['data'];
    User user = User.fromJson(data['user']);
    // String refreshToken = data['refreshToken'];
    String accessToken = data['token'];

    GetStorage authStorage = GetStorage('authStorage');
    await authStorage.write('user', user.toJson());
    // await authStorage.write('refreshToken', refreshToken);
    await authStorage.write('accessToken', accessToken);
    await authStorage.write('isAuth', true);

    return user;
  } else {
    bool? isPassResetReq = response?['data']?['isPassResetReq'];
    return User(
      id: '',
      name: '',
      username: '',
      email: '',
      phone: '',
      image: '',
      role: '',
      designation: '',
      status: '',
      userWeight: 999999,
      isPassResetReq: isPassResetReq ?? false,
    );
  }
}

Future<String?> requestPasswordResetOtp({required String email}) async {
  Map<String, dynamic> body = {
    'identifier': email,
  };

  var response = await postRequest(
    uri: '/auth/password-reset',
    body: body,
  );

  if (response?['status'] == 200) {
    return response?['data']['token'];
  }
  return null;
}

Future<bool> updatePassword({
  required String otp,
  required String token,
  required String password,
}) async {
  Map<String, dynamic> body = {
    'otp': otp,
    'password': password,
  };

  var response = await patchRequest(
    uri: '/auth/password-update/$token',
    body: body,
  );

  if (response?['status'] == 200) {
    return true;
  }
  return false;
}

Future logout() async {
  //await postRequest(uri: '/auth/logout');
  GetStorage authStorage = GetStorage('authStorage');
  await authStorage.write('user', null);
  await authStorage.write('refreshToken', null);
  await authStorage.write('accessToken', null);
  await authStorage.write('isAuth', false);
}
