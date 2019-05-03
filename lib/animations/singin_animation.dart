import 'package:flutter/material.dart';

class SingInAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> buttonSqueezeAnimation;
  final Animation<double> buttonZoomOut;
  Text text;
  SingInAnimation({ this.controller ,this.text }) :

      buttonSqueezeAnimation = new Tween(
        begin: 280.0,
        end: 60.0
      ).animate(
        new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 0.150)
        )
      ),

      buttonZoomOut = new Tween(
          begin: 70.0,
          end: 1000.0
      ).animate(
          new CurvedAnimation(
              parent: controller,
              curve: new Interval(0.550, 0.999 , curve: Curves.bounceOut)
          )
      );

  Widget _animationBuilder(BuildContext context , Widget child) {
    return buttonZoomOut.value <= 300
        ?  new Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: buttonZoomOut.value == 70
                    ? buttonSqueezeAnimation.value
                    : buttonZoomOut.value,
              height: buttonZoomOut.value == 70
                  ? 60
                  : buttonZoomOut.value,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: new Color(0xff19b395),
                  borderRadius: buttonZoomOut.value < 400
                    ? new BorderRadius.all(const Radius.circular(30))
                    : new BorderRadius.all(const Radius.circular(0))
              ),
              child: buttonSqueezeAnimation.value > 75
                  ? text
                  : buttonZoomOut.value < 300.0
                    ? new CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : null
                  ,
            )
        :  new Container(
              width: buttonZoomOut.value,
              height: buttonZoomOut.value,
              decoration: new BoxDecoration(
                shape: buttonZoomOut.value < 500
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                color : const Color(0xff19b395)
              ),
          );
  }


  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: controller ,
        builder: _animationBuilder
    );
  }

}