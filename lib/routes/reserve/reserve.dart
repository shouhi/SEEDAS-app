import 'package:seedas/importer.dart';

class Reserve extends StatefulWidget {
  Reserve({Key key}) : super(key: key);
  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  TabController _controller;
  List<Widget> _buildTabs() {
    return [
      //Firebaseの値によってタブの個数を変える
      // for (var i = 0; i < 3;i++)
      //   Tab(text: '12月${28+i}日'),
      Tab(text: '12月28日'),
    ];
  }

  List<Widget> _buildTabPages() {
    return [
      //Firebaseの値によってタブの個数を変える
      // for (var i = 0; i < 3;i++)
      DayPage(),
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
              body: TabBarView(
                controller: _controller,
                children: _buildTabPages(),
              ),
            )));
  }
}
