import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String userName;
  final String password;
  bool isLoggedIn;

  User({
    this.id,
    required this.userName,
    required this.password,
    required this.isLoggedIn,
  });
}
