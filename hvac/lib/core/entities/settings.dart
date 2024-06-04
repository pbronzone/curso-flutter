import 'package:floor/floor.dart';

@entity
class Settings {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int userId;

  Settings({
    required this.id,
    required this.userId,
  });
}
