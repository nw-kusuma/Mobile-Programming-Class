import 'package:flutter/material.dart';
import '../../components/export_widgets.dart';

class SwitchFirstPage 
  extends StatelessWidget {
    final String _text =
    """Now, let's talk a bit about swtching pages. Flutter does them with Navigator methods. Navigator works like a stacks in Data Structure, with PUSH and POP.
    \nPUSH take a the new screen and places it on top of the current one.
    \nPOP take the current screen and remove it from the stacks to get back to the previous screen under it.""";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar('Switch-Page: Page One'),
        body: buildBodyBackground(size, 1, 11, 40.0, false,
          topChild: Container(width: 0,), 
          bottomChild: Padding(
            padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 5.0),
            child: Column(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Woah we are PUSH-ed into another page!",
                      style: TextStyle(
                        fontSize: 24.0, 
                        color: kPrimaryLight,
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 45.0),
                    Text(_text,
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 25.0),
                    Text("\nLets try PUSH-ing in another page again..",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                      ),),
                      child: Text("PUSH to SECOND page"),
                      onPressed: () => 
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (BuildContext context) 
                                  => SwitchSecondPage())), 
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

class SwitchSecondPage 
  extends StatelessWidget {
    final String _text =
    """Notice the left arrow icon above?
    \nWhen clicked, it will POP us back to the FIRST page. It works as it was pointed out in the previous page.
    \nBefore we go back though, lets PUSH in another page using another PUSH methods, PUSH REPLACEMENTS.""";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar('Switch-Page: Page Two'),
        body: buildBodyBackground(size, 1, 11, 40.0, false,
          topChild: Container(width: 0,), 
          bottomChild: Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 5.0),
            child: Column(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Now we are in another page, lets call it the SECOND page",
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: kPrimaryLight,
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 45.0),
                    Text(_text,
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify),
                    SizedBox(height: 25.0),
                    Text("\nNow lets try it out now..",
                      style: TextStyle(
                        fontSize: 16.0, 
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                      ),),
                      child: Text("PUSH to THIRD page"),
                      onPressed: () => 
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (BuildContext context) 
                                  => SwitchThirdPage())), 
                  ),],
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

class SwitchThirdPage 
  extends StatelessWidget {
  final _texts = [
  """However, when the left arrow button above is clicked, it will not POP us back to the previous page (the SECOND page) like before.
  \nInstead, it will POP us back straight to the FIRST page.
  \nIt is because the SECOND page doesn't exist anymore in the stacks when we used the PUSH REPLACEMENT method with the button in the previous page to get here.
  \nPUSH REPLACEMENT method works just like the normal PUSH, but instead of just placing the new page on top the previous page, the new page replace it in the stacks.
  \nSo, in a sense its like using POP and PUSH at the same time.""", 
  """\nNow try click on that left arrow button."""];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar('Switch-Page: Page Three'),
        body: buildBodyBackground(size, 1, 11, 40.0, false,
          topChild: Container(width: 0,), 
          bottomChild: Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 5.0),
            child: Column(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Now we are in the THIRD page",
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: kPrimaryLight,
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35.0),
                    Text(_texts[0],
                      style: TextStyle(
                        fontSize: 16.0, 
                        fontWeight: FontWeight.w600),
                      textAlign: TextAlign.justify),
                    Text(_texts[1],
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left),
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
