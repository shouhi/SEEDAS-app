import 'package:seedas/importer.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TabController _controller;
  List<Widget> _buildTabs() {
    return [
      Tab(text: 'blog'),
      Tab(text: 'qiita'),
    ];
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
