import 'package:seedas/importer.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabController _controller;
  List<Widget> _buildTabs() {
    return [
      Tab(text: 'メンバー'),
      Tab(text: '目標一覧'),
    ];
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signOut() async {
    await _auth.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => SignIn()), (_) => false);
  }
  Widget _sideBer(){
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                const Text('設定'),
              ],
            ),
          ),
          Divider(),
          ListTile(
              title: const Text('プロフィール編集', ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );
              }
          ),
          ListTile(
              title: const Text('目標設定'),
          ),
          ListTile(
              title: const Text('パスワード変更'),
          ),
          ListTile(
              title: const Text('ログアウト'),
              onTap: _showSignOutDialog
          ),
        ],
      ),
    );
  }
  _showSignOutDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("ログアウトしますか？"),
          actions: <Widget>[
            FlatButton(
              child: Text('キャンセル'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                _signOut();
              },
            )
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: _buildTabs().length,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                bottom: TabBar(
                  controller: _controller,
                  tabs: _buildTabs(),
                ),
              ),
            )));
  }
}
