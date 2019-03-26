class User{
  final String _userId;
  final String _password;

  User(this._userId, this._password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              _userId == other._userId &&
              _password == other._password;

  @override
  int get hashCode =>
      _userId.hashCode ^
      _password.hashCode;

}