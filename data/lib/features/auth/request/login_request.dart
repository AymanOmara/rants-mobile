import 'package:data/network/remote_target.dart';

class LoginRequest extends IRemoteTarget {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  }) {
    body = {"Email": email, "Password": password};
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => "api/Auth/token";
}
