import 'package:tw_cafeteria/model/user.dart';
import 'package:tw_cafeteria/constants/user_credential.dart';

class UserAuthenticator{

  static bool isAuthenticUser(User user){

    User adminUser = new User(UserCredential.adminUsername, UserCredential.adminPassword);

    return adminUser == user;
  }

}