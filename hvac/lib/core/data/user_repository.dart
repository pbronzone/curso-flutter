import 'package:hvac/core/entities/user.dart';
import 'package:hvac/main.dart';

class UserRepository {
  final _userDao = database.userDao;

  Future<List<User>> findAllUsers() async {
    return _userDao.findAllUsers();
  }

  Future<User?> findUserById(int id) {
    return _userDao.findUserById(id);
  }

  Future<void> insertUser(User user) async {
    _userDao.insertUser(user);
  }

  Future<void> updateUser(User user) async {
    _userDao.updateUser(user);
  }

  Future<void> deleteUser(User user) async {
    _userDao.deleteUser(user);
  }
}
