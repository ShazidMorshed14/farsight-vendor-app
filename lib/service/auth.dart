import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:get_storage/get_storage.dart';
import 'package:farsight_vendor_app/model/user.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<User> signin(
    {required String identifier, required String password}) async {
  Map<String, dynamic> body = {
    'identifier': '+88$identifier',
    'password': password,
  };

  var response = await postRequest(
    uri: '/vendor/auth/signin',
    body: body,
  );

  if (response?['status'] == 200) {
    var data = response?['data'];
    //print('response-->$response');
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
      id: response?['data']?['_id'] ?? '',
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

Future<bool> updatePassword({
  required String password,
  required String confirmPassword,
  required String id,
}) async {
  Map<String, dynamic> body = {
    'password': password,
    'confirmPassword': confirmPassword,
  };

  var response = await putRequest(
    uri: '/vendor/auth/reset-password/$id',
    body: body,
  );

  if (response?['status'] == 200) {
    successNotif(message: 'Password Reset Completed!');
    return true;
  }
  return false;
}

Future logout() async {
  //await postRequest(uri: '/auth/logout');
  GetStorage authStorage = GetStorage('authStorage');
  await authStorage.write('user', null);
  // await authStorage.write('refreshToken', null);
  await authStorage.write('accessToken', null);
  await authStorage.write('isAuth', false);
}
