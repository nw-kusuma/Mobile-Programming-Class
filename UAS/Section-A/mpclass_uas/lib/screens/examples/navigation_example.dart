import 'package:flutter/material.dart';
import '../../components/export_widgets.dart';

class NavExamplePage 
  extends StatelessWidget {
  final String _texts = 
  """See the top bar with the title above? it's another kind of Navigation/Menu called an AppBar.
  \nAlso, see that menu (three paralel lines) icon in it? It's another navigation/menu called a Drawer.
  \nNow, pick any option in the drawer menu to go back.""";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: buildAppDrawer(context, size),
        appBar: buildAppBar('AppBar & Drawer'),
        body: buildBodyBackground(size, 1, 11, 40.0, false,
          topChild: Container(width: 0,), 
          bottomChild: Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 5.0),
            child: Column(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_texts,
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w600),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),),
                Align(
                  child: Image.asset("assets/images/Logo_UB_Tengah.png",
                    width: size.width * 0.90,
                ),),
            ]),
          ),
        ),
      ),
    );
  }
}