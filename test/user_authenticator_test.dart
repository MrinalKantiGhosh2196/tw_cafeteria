import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/service/user_authenticator.dart';
import 'package:tw_cafeteria/model/user.dart';

void main(){
  test("should return true for providing admin credentials", () {
    User user = User("admin", "admin");
    expect(true, UserAuthenticator.isAuthenticateUser(user));
  });

  test("should return false for providing wrong admin credentials", () {
    User user = User("admin", "password");
    expect(false, UserAuthenticator.isAuthenticateUser(user));
  });
}