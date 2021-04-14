import 'package:flutter/material.dart';
import 'package:flutter_contoh/included/include_releases_content.dart';
import 'package:flutter_contoh/model/BottomNav.dart';

class BottomNavigationShiftingRoute extends StatefulWidget {
  final List<BottomNav> itemsNav = <BottomNav>[
    BottomNav('JAVA', Icons.code, Colors.blueGrey[700]),
    BottomNav('KOTLIN', Icons.add_business_outlined, Colors.pink[800]),
    BottomNav('FLUTTER', Icons.book_online, Colors.teal[800]),
    BottomNav('REACT', Icons.web_sharp, Colors.grey[700])
  ];

  @override
  _BottomNavigationShiftingRouteState createState() =>
      _BottomNavigationShiftingRouteState();
}

class _BottomNavigationShiftingRouteState
    extends State<BottomNavigationShiftingRoute>
    with TickerProviderStateMixin<BottomNavigationShiftingRoute> {
  int currentIndex = 0;
  BuildContext ctx;

  void onBackPress(){
    if(Navigator.of(ctx).canPop()){
      Navigator.of(ctx).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    BottomNav curItem = widget.itemsNav[currentIndex];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 1,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.grey[600],
                        highlightColor: Colors.grey[600],
                        onTap: onBackPress,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.menu,
                            size: 23.0,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Text("Search : " + curItem.title, style: TextStyle(color: Colors.grey[600]),),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.mic,
                          size: 23.0,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(15)
            ),
            backgroundColor: Colors.grey[200],
            automaticallyImplyLeading: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return IncludeReleasesContent.get(context);
            }, childCount: 1 ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: widget.itemsNav.map((BottomNav d){
          return BottomNavigationBarItem(
            backgroundColor: d.color,
            icon: Icon(d.icon),
            title: Text(d.title),
          );
        }).toList(),
      ),
    );
  }
}
