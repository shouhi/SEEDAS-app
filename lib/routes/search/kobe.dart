import 'package:seedas/importer.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("神戸"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(crossAxisCount: 2,primary: false,crossAxisSpacing: 10.0,mainAxisSpacing: 15.0,childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard("飯とおかず 酒と肴 花", "兵庫県神戸市中央区加納町4-7-2 アルバビル 5F", "assets/Icon/client1.jpeg", true, context),
                _buildCard("Magie", "兵庫県神戸市中央区加納町４丁目９−１２", "assets/Icon/client2.jpeg", true, context),
                _buildCard("MAGIE'S風", "兵庫県神戸市中央区下山手通１-５-４", "assets/Icon/client3.png", true, context)
              ],),
            )
          ],)
        );
  }

  Widget _buildCard(String name,String locate, String imgPath,bool isFavorite, context) {
    return Padding(padding: EdgeInsets.only(top: 15.0, bottom: 5.0,left: 5.0,right: 5.0),
    child: InkWell(onTap: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RootWidget()));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(color: Const.utilColor["gray"].withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0
              )
        ],
        color: Colors.white
      ),
      child: Column(children: [Padding(padding: EdgeInsets.all(5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isFavorite ? Icon(Icons.favorite, color: Const.utilColor["favorite"])
        :Icon(Icons.favorite, color: Const.utilColor["favorite"])
      ],
      ),
      ),
      Hero(tag: imgPath,
      child: Container(height: 100.0, width: 100.0,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgPath),
      fit: BoxFit.contain)
      )
      ),
      ),
      SizedBox(height: 7.0,),
      Text(name,
        style: TextStyle(color: Const.utilColor["black"],fontFamily: 'Varela',fontSize: 14.0)),
      Padding(padding: EdgeInsets.all(8.0),
      child: Container(color: Const.utilColor["black"],
      height: 1.0,)
      ),
      Text(locate,
        style: TextStyle(color: Const.utilColor["orange"],fontFamily: 'Varela',fontSize: 14.0)),
      ],),
    )));
  }
}