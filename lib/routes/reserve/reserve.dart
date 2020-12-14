import 'package:seedas/importer.dart';

class Reserve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReserveState();
  }
}

class ReserveState extends State<Reserve> with TickerProviderStateMixin {
  Map<DateTime, List> _events = {};
  List _selectedEvents;
  List calenderList;
  AnimationController _animationController;
  bool isLoading = true;
  DateTime selectedDateTime;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    final _selectedDay = DateTime.now();
    _selectedEvents = _events[_selectedDay] ?? [];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    setState(() {
      _selectedEvents = events;
      selectedDateTime = day;
      print(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Now Loading...',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 8.0),
                const SizedBox(height: 8.0),
                Expanded(child: _buildEventList()),
              ],
            ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
            final now = DateTime.now();
            (selectedDateTime == null)
                ? print("aa")
                : print("bb");
          },
        ),
      ),
    );
  }



  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
