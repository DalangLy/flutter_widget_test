import 'login_service_interface.dart';

class LoginService implements LoginServiceInterface {
  @override
  Future<bool> login() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}