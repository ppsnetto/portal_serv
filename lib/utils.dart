import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import 'package:mysql1/mysql1.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class Mysql {
  static String host = '10.1.0.4',
      user = 'root',
      password = 'pm2sl0@da1ta3base',
      db = 'teste';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );
    return await MySqlConnection.connect(settings);
  }
}
