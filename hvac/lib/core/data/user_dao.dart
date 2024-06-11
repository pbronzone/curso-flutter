import 'package:floor/floor.dart';
import 'package:hvac/core/entities/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User user);

  @delete
  Future<void> deleteUser(User user);
}
