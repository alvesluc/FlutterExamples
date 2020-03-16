
import 'package:dio_node_example/utils/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  login() {
    var dio = CustomDio().instance;

    dio.post('http://192.168.1.4:3000/login', data: {
      'username': 'alvesluc',
      'password': 'lucas123'
    }).then((res) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.data['token']);
    }).catchError((err) {
      throw Exception('Invalid login or password');
    });
  }
}