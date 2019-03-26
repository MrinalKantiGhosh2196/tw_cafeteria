import 'package:tw_cafeteria/model/user.dart';
import 'package:tw_cafeteria/constants/user_credential.dart';

class UserAuthenticator{

  static bool isAuthenticateUser(User user){

    User adminUser = new User(UserCredential.adminUserId, UserCredential.adminPassword);

    return adminUser == user;
  }

}