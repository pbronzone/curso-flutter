import 'package:floor/floor.dart';

@entity
class HvacDevice {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final bool isOnline;
  final bool? status;
  final double? temp;
  final double? setpoint;
  final String? mode;
  final String? fan;
  final String? type;
  final String? img;

  HvacDevice({
    required this.id,
    required this.name,
    required this.isOnline,
    this.status,
    this.temp,
    this.setpoint,
    this.mode,
    this.fan,
    this.type,
    this.img,
  });
}
