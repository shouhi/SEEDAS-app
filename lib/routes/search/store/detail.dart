import 'package:seedas/importer.dart';
import 'package:seedas/models/category.dart';
import 'package:seedas/models/hana.dart';

// Make the detail page
class DetailPage extends StatelessWidget {
  final Category item;

  const DetailPage({this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/Icon/logo.png',
            height: 100,
          ),
          backgroundColor: Const.utilColor["white"],
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.favorite_border,color: Colors.green,),),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "交渉する",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                ),
              ))
          ],
        )
        ),
        body: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Const.utilColor["mildgreen"],
                  ),
              child: buildImageWidget(),
              ),
              SizedBox(
                height: 50,
              ),

              Positioned(
                top: 430,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 30.0, top: 30.0, ),
                      child: Text(
                        "飯とおかず 酒と肴 花",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        '_________________________',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 30.0,top: 20),
                      child: Text(
                        '時間:9:00~15:00(月曜~土曜)\n9:00~15:00/16:00~22:00(日曜)',
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 30.0,top: 5),
                      child: Text(
                        '場所:兵庫県神戸市中央区加納町4-7-2 アルバビル 5F',
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 30.0,top: 5),
                      child:  Text(
                          '料金:¥10,000/日',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                          ),
                          Padding(padding: const EdgeInsets.only(left: 30.0,top: 5),
                          child:Text(
                          '席数:28席',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                )
            ],
          )
          ]
          )
    );
        
  }

  Container buildImageWidget() {
    return Container(
      height: 400,
      padding: EdgeInsets.only(top: 32, bottom: 32, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text("素敵なお店を見つけてください",
          //     style: TextStyle(
          //       fontSize: 26,
          //       fontWeight: FontWeight.bold,
          //       letterSpacing: 1.0,
          //     )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  height: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      Hana hana = hanas[index];
                      return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(item: categories[index])),
                              ),
                          child: Container(
                              width: 300,
                              margin: index == 0
                                  ? EdgeInsets.only(
                                      left: 16, right: 16, top: 4, bottom: 4)
                                  : EdgeInsets.only(
                                      right: 16, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, 4.0),
                                      blurRadius: 6,
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        height: 270,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          child: Image(
                                            image: AssetImage(hana.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                ],
                              )));
                    },
                  )))
        ],
      ),
    );
  }
}
