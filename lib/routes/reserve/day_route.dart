import 'package:seedas/importer.dart';

class DayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calendarPage(),
      theme: ThemeData(
        fontFamily: 'ubuntu'
      ),
    );
  }
}
class calendarPage extends StatefulWidget {
  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Const.utilColor["mild_purple"],
      body: Column(
        children: [
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("28 December 2020", style: TextStyle(
                            color: Colors.grey
                          ),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          dayTask("10:00", "井手"),
                          dayTask("11:00", "Alexandra Johnson"),
                          dayTask("12:00", "Michael Hamilton"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Row dayTask(String time, String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width*0.2,
          child: Text(time, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ), textAlign: TextAlign.right,),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color(0xffdfdeff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(
                  color: Const.utilColor["mild_purple"],
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 10,),
                Text('Time', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, color: Const.utilColor["mild_purple"],),
                    SizedBox(width: 5,),
                    Text("$time - 13:00", style: TextStyle(
                      color: Const.utilColor["mild_purple"],
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("人数", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(width: 5,),
                    Icon(Icons.people),
                    Icon(Icons.people),
                    Icon(Icons.people),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(Icons.call, color: Const.utilColor["mild_purple"],),
                    SizedBox(width: 5,),
                    Icon(Icons.mail_outline, color: Const.utilColor["mild_purple"],),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}