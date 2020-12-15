import 'package:seedas/importer.dart';

class DayPage extends StatefulWidget {
  DayPage({Key key}) : super(key: key);

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[ 
             ListTile(
              title: Text('1位👑'),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/Icon/ST_Hillslogo.JPG'),
                        radius: 30.0,
                      ),
                title: Text('ST_Hillsカフェ'),
                subtitle: Text('売上:¥64,000'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            ListTile(
              title: Text('2位'),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/Icon/exe1logo.jpeg'),
                        radius: 30.0,
                      ),
                title: Text('カカオカップ'),
                subtitle: Text('売上:¥53,000'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            ListTile(
              title: Text('3位'),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/Icon/coffee_time.png'),
                        radius: 30.0,
                      ),
                title: Text('SuperNova'),
                subtitle: Text('売上:¥51,000'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            ListTile(
              title: Text('4位'),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/Icon/coffeeshoplogo.jpeg'),
                        radius: 30.0,
                      ),
                title: Text('コーヒーカフェ'),
                subtitle: Text('売上:¥44,000'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ]
    ));
  }
}
