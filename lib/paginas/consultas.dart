import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:portal_serv/utils.dart';
import 'package:url_launcher/url_launcher.dart';

mixin consulta implements StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal do Servidor',
    );
  }
}

class consultas extends StatefulWidget {
  const consultas({Key? key}) : super(key: key);

  @override
  _consultasState createState() => _consultasState();
}

class _consultasState extends State<consultas> {
  int _counter = 0;
  var db =  Mysql();
  var nm_local = '';

  void _getCustomer() {
    db.getConnection().then((conn) {
      String sql = 'SELECT  nm_local  from tmp_locais;';
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            nm_local = row[0];
          });
        }
      });
      conn.close();
    });
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('teste'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'nm_local:',
            ),
            Text(
              '$nm_local',
              style: Theme.of(context).textTheme.button,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCustomer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
