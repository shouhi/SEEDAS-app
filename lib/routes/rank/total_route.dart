import 'package:seedas/importer.dart';


class TotalPage extends StatefulWidget {
  TotalPage({Key key}) : super(key: key);

  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(      
          child: InkWell( // Cardの子ウィジェットとしてInkWellを使用する
            onTap: () {},
            child: Container(
              height: 300.0,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      color: Colors.grey,
                    ),
                    height: 150.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title...',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'SubTitleSubTitleSubTitleSubTitleSubTitleSubTitle...'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ), 
    );
  }
}