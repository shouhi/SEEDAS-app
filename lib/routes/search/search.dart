import 'package:seedas/importer.dart';
import 'package:seedas/models/category.dart';
import 'package:seedas/models/store_item.dart';
import 'package:seedas/routes/search/store/detail.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        drawer: drawerMain(context),
        body: Column(children: <Widget>[
          Container(
            //修正必須
               height: MediaQuery.of(context).size.height * .79,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 4)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "地域から探す",
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        // buildFilterWidget(),
                        buildCategoryWidget(),
                        buildGridWidget("高評価の店舗", "店舗経営を行った学生から評価を頂いています",
                            "experiences", experiences),
                      ],
                    ),
                  )
                ],
              ))
        ]
        )
        );
  }

  Container buildGridWidget(String title, String prefecture, String buttonText,
      List<StoreItem> stores) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "高評価の店舗",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "店舗経営を行った学生から評価を頂いています",
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.0,
            ),
          ),
          buildGridRowWidget(stores, 0, 1),
        ],
      ),
    );
  }

  Container buildGridRowWidget(
      List<StoreItem> stores, int indexOne, int indexTwo) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            height: 275,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image(
                    image: AssetImage(stores[indexOne].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      stores[indexOne].prefecture,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.red[900],
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      stores[indexOne].name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "¥${stores[indexOne].price}/日",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${stores[indexOne].time}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("🔥"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${stores[indexOne].rating}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.people,
                          size: 15,
                        ),
                        Text("${stores[indexOne].ratingCount}組")
                      ],
                    )
                  ],
                ))
              ],
            ),
          )),
          SizedBox(
            width: 30,
          ),
          Expanded(
              child: Container(
            height: 275,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image(
                    image: AssetImage(stores[indexTwo].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      stores[indexTwo].prefecture,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.red[900],
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      stores[indexTwo].name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "¥${stores[indexTwo].price}/日",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${stores[indexTwo].time}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("🔥"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${stores[indexTwo].rating}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.people,
                          size: 15,
                        ),
                        Text("${stores[indexTwo].ratingCount}組")
                      ],
                    )
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container buildCategoryWidget() {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 32, bottom: 32, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("素敵なお店を見つけてください",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  height: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      Category category = categories[index];
                       return GestureDetector(
                         onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailPage(item: categories[index])),
                          ),
                      child: Container(
                          width: 140,
                          margin: index == 0
                              ? EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4)
                              : EdgeInsets.only(right: 16, top: 4, bottom: 4),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image(
                                        image: AssetImage(category.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: Text(
                                  category.categoryName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              )
                            ],
                          )));
                    },
                  )
                )
              )
        ],
      ),
    );
  }

//   Container buildFilterWidget() {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.0),
//                   color: Colors.white,
//                   border: Border.all(
//                       color: Colors.grey[400],
//                       width: 1.0,
//                       style: BorderStyle.solid)),
//               child: Text(
//                 "兵庫",
//                 style: TextStyle(
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.0),
//                   color: Colors.white,
//                   border: Border.all(
//                       color: Colors.grey[400],
//                       width: 1.0,
//                       style: BorderStyle.solid)),
//               child: Text(
//                 "大坂",
//                 style: TextStyle(
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.0),
//                   color: Colors.white,
//                   border: Border.all(
//                       color: Colors.grey[400],
//                       width: 1.0,
//                       style: BorderStyle.solid)),
//               child: Text(
//                 "滋賀",
//                 style: TextStyle(
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
}
