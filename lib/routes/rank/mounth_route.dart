import 'package:seedas/importer.dart';

class MounthlyPage extends StatefulWidget {
  MounthlyPage({Key key}) : super(key: key);

  @override
  _MounthlyPageState createState() => _MounthlyPageState();
}

class _MounthlyPageState extends State<MounthlyPage> {
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
                subtitle: Text('売上:¥50,379'),
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
                subtitle: Text('売上:¥49,000'),
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
                subtitle: Text('売上:¥46,000'),
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
                subtitle: Text('売上:¥37,000'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ]
    ));
  }
}
