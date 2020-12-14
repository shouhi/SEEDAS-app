import 'package:seedas/importer.dart';

class Blog extends StatefulWidget {
  Blog({Key key}) : super(key: key);
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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
