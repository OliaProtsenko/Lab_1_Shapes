import 'package:flutter/material.dart';
import 'package:lab_1_shapes/history_page.dart';
import 'package:lab_1_shapes/home_page/HomeNavigation.dart';
import 'package:lab_1_shapes/info_page/info_page.dart';

import 'bloc/home_page_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomePageBloc bloc;
  final Map<HomeTab, Widget> _tabs = {
    HomeTab.home: HomeNavigation(),
    HomeTab.history: HistoryPage(),
    HomeTab.info: InfoPage(),
  };

  void _onItemTapped(int index) {
    switch (HomeTab.values[index]) {
      case HomeTab.home:
        bloc.onHomeSelected();
        break;
      case HomeTab.info:
        bloc.onInfoSelected();
        break;
      case HomeTab.history:
        bloc.onHistorySelected();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    bloc = HomePageBlocImpl();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
      initialData: bloc.state.value,
        stream: bloc.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
        return Scaffold(

          body:
              (data == null) ?
                 CircularProgressIndicator():
                 Stack(children: [
                  Offstage(
                      offstage: data.tab != HomeTab.home,
                      child: Center(
                        child: _tabs[HomeTab.home],
                      )),
                  if (data.tab != HomeTab.home)
                    Center(
                      child: _tabs[data.tab],
                    )
                ]),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: Theme.of(context).tabBarTheme.labelColor,
            items: _buildTabBarItem(context),
            currentIndex:data==null?0:data.tab.index ,
            onTap: _onItemTapped,
          ),
        );
      }
    );
  }

  List<BottomNavigationBarItem> _buildTabBarItem(BuildContext context) {
    final tabBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.history,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.info,
        ),
        label: '',
      ),
    ];
    return tabBarItems;
  }
}
