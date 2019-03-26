import 'package:flutter_test/flutter_test.dart';
import 'package:tw_cafeteria/model/user.dart';

void main() {
  test("should return true by comparing two user having same userId, password", () {
      User firstUser = new User("flutter", "dart");
      User secondUser = new User("flutter", "dart");

      expect(true, firstUser == secondUser);
  });

  test("should return false by comparing two user having different userId, password", () {
    User firstUser = new User("flutter", "dart");
    User secondUser = new User("dart", "dart");

    expect(false, firstUser == secondUser);
  });
}