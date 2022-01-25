import 'package:flutter/material.dart';
import '../../export_packages.dart';
import '../../export_widgets.dart';

class NavExamplePage 
  extends StatelessWidget {
  final String _bnbTitle = "Now we are here in another page, Navigation examples";
  final String _appTitle = "Navigation: AppBar";
  final String _tabTitle = "Navigation: TabBar";
  final String _fabTitle = "Navigation: FAB Menu";
  final String _drawerTitle = "Navigation: Drawer";

  final String _bnbText = 
  """You have seen the BottomNavigationBar (BNB) before, the rows of icons/buttons in the main screen.
  \nBNB is neat way to provides quick navigation between the top-level views of an app.
  \nIt's easy and customizable. Almost 90% of the mobile app, native or hybrid, out there utilize it along with other navigation means such as AppBar, Drawer, TabBar, etc.""";

  final String _appText = 
  """You have also been familiar with the AppBar, the topmost row of items such as back arrow, title, etc.
  \nAppBar are great way to places identification of the app or the current views and some of the functionality or navigation buttons.
  \nMost app usually use it to holds the title, back and/or menu buttons, search functionality, or even current user identity.""";

  final String _drawerText = 
  """While we are at the top bar, notice the three-line-bars at the right-end of it? It's called a Drawer.
  \nDrawer is basically a menu in the traditional sense of it.
  \nJust like any menu it contains list of navigation shortcuts that points to any section or level of views in the app.""";

  final String _tabText = 
  """Finally we arrive at it, the TabBar. Yes, by now, you must have used to the buttons-slash-tab above to navigate between these views.
  \nTabBar organize and allow navigation between groups of content that are related and at the same level of hierarchy.
  \nYou may have seen it a lot in many app, especially in the shopping app, where it used to holds categories of products.""";

  final String _fabText = 
  """Lastly, notice the round buttons floating in the bottom right corner? It's called FloatingActionButton.
  \nFAB is not really a menu in the real sense of it, it's a button. However, it can be customized to act as a menu.
  \nMany app utilize customized FAB mostly as a some kind of contact options menu, like shown in the example bellow.""";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        endDrawer: AppDrawer(),
        appBar: AppTopBar(
          titleText: "Navigation: TabBar, Drawer, AppBar", 
          showBack: true),
        body: AppBodyBackground(2, 10, 30.0, false,
          topChild: Padding(
            padding: const EdgeInsets.only(top: 75.0, bottom: 5.0),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: kPrimaryDark,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(45.0)),
                color: kPrimaryDark),
              tabs: [
                buildTabItems('BNB Nav', Icons.call_to_action_outlined),
                buildTabItems('AppBar Nav', CupertinoIcons.macwindow),
                buildTabItems('Drawer', CupertinoIcons.text_aligncenter),
                buildTabItems('TabBar Nav', Icons.tab_outlined),
                buildTabItems('FAB Menu', CupertinoIcons.viewfinder_circle),
              ]),
          ), 
          bottomChild: Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 5.0),
            child: Column(
              children: [
                Expanded(child: TabBarView(
                  children: [
                    buildTabViews(_bnbTitle, 22.0, _bnbText),
                    buildTabViews(_appTitle, 24.0, _appText),
                    buildTabViews(_drawerTitle, 24.0, _drawerText),
                    buildTabViews(_tabTitle, 24.0, _tabText),
                    buildTabViews(_fabTitle, 24.0, _fabText),
                  ],
                ),),
                Align(
                  child: Image.asset("assets/images/Logo_UB_Tengah.png",
                    width: size.width * 0.6,
                ),),
            ]),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 25.0),
          child: AppFABMenu(),
        ),
      ),
    );
  }

  Widget buildTabViews(_title, _size, _text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_title,
          style: TextStyle(
            fontSize: _size, 
            color: kPrimaryLight,
            fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.0),
        Text(_text,
        style: TextStyle(
          fontSize: 18.0, 
          fontWeight: FontWeight.w600),
        textAlign: TextAlign.justify,
      ),
    ]);
  }

  Widget buildTabItems(_label, _icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(_icon),
          SizedBox(width: 2.5),
          Text(_label, textScaleFactor: 1.15)
        ],
      ),
    );
  }
}