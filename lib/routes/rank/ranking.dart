import 'package:seedas/importer.dart';

class Ranking extends StatefulWidget {
  Ranking({Key key}) : super(key: key);
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  TabController _controller;
  List<Widget> _buildTabs() {
    return [
      Tab(text: '月間'),
      Tab(text: '通算'),
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
                title: Image.asset(
                  'assets/Icon/logo.png',
                  height: 100,
                ),
                backgroundColor: Const.utilColor["white"],
                bottom: TabBar(
                  controller: _controller,
                  tabs: _buildTabs(),
                  labelColor: Colors.black,
                ),
              ),
            )));
  }
}
