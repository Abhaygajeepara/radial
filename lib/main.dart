import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Animation animation,childanimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 4),vsync: this);
    animation = Tween(begin: -0.20,end: 0.0).animate(CurvedAnimation(
      parent: _controller,
          curve: Curves.easeIn,
    ));
    childanimation = Tween(begin: 20.0,end: 125.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn
    ));
    print(childanimation.value);
   /* delayedanimation =Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.8,1.0, curve: Curves.fastOutSlowIn)
    ));*/
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context,Widget child){
        final double width = MediaQuery.of(context).size.width;
        return Scaffold(

          body: Align(
            alignment: Alignment.center,
            child:ListView(
              shrinkWrap: true,
              children: [
                Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: AnimatedBuilder(
                    animation: childanimation,
                    builder: (BuildContext context ,Widget child){
                      return new Container(
                        height: childanimation.value * 2,
                        width: childanimation.value * 2,
                        child: Center(
                          child: Container(
                            child: Container(
                              height: 180,
                              width: 180,
                              color: Colors.orange,
                            )
                          ),
                        ),
                      );
                    },
                  )
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}


/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 1.0, end:0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform:
                Matrix4.translationValues(animation.value * width, -100.0, 20.0),
            child:  new Center(
              child: Container(
                child: Text(
                  'Ad Gajeepara',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/