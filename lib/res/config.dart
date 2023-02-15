import 'package:dio/dio.dart';

class ConfigAPI {
  //Example: https://www.example.com without /
  static const String basrUrl = 'http://127.0.0.1:3000/api/';
  static const int sessionTimeoutThreshold = 0; // Will refresh the access token 5 minutes before it expires
  static const bool loginWithPassword = true; // if false hide the form login
  //if false hide the fields password and confirm password from signup form
  //for security reason and the password generated after verification mail
  static const bool signupWithPassword = true;
}
class AuthEndPoint{
  final String reg ='register';
  final String login='login';
}

class ApiAuthClient {

  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response =
      await _dio.post('http://127.0.0.1:3000/api/register',
          data: userData,
          options: Options(headers: {
            Headers.acceptHeader: "application/json",
          }));
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}