import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';

class TabsWithIndicator extends StatefulWidget {
  const TabsWithIndicator({Key? key}) : super(key: key);

  @override
  _TabsWithIndicatorState createState() => _TabsWithIndicatorState();
}

class _TabsWithIndicatorState extends State<TabsWithIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 108.0),
          child: ElevatedButton.icon(
              onPressed: bottomDialog,
              icon: Icon(Icons.pages),
              label: Text("Open Bottomsheet")),
        ),
      ),
    );
  }

  bottomDialog() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      //enableDrag: false,
      builder: (context) {
        return Container(
          height: 500,
          width: double.infinity,
          color: Colors.grey.shade200,
          alignment: Alignment.topCenter,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
               body:
                Column(
                  children: <Widget>[
                    Material(
                      color: Colors.amber,
                      child: TabBar(
                        indicatorColor: Colors.green,
                        tabs: [
                          Tab(
                            text: "Home",
                          ),
                          Tab(
                            text: "Work",
                          ),
                          Tab(
                            text: "Play",
                          ),
                        ],
                        labelColor: Colors.black,
                        indicator: ContainerTabIndicator(
                          width: 16,
                          height: 16,
                          radius: BorderRadius.circular(8.0),
                          padding: const EdgeInsets.only(right: 36),
                          borderWidth: 2.0,
                          color: Colors.white,
                          borderColor: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarView(
                        children: [
                          Icon(Icons.directions_car),
                          Icon(Icons.directions_transit),
                          Icon(Icons.directions_bike),
                        ],
                      ),
                    )
                  ],
                )

            ),
          ),
        );
      },
    );
  }
}

