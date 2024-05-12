import 'package:flutter/material.dart';

class ScreenSizes {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double geWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

void navigateAndKillTo(context, widget) {
  Navigator.pushReplacement(
    context,
    PageSlideTransitionRoute(widget),
  );
}

class PageSlideTransitionRoute extends PageRouteBuilder {
  final dynamic page;
  PageSlideTransitionRoute(this.page)
      : super(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondryAnimation) => page,
          transitionsBuilder: (context, animation, secondryAnimation, child) {
            var tween = Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            );
            Animation<Offset> slideAnimation = tween.animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
            );

            return SlideTransition(
              position: slideAnimation,
              child: child,
            );
          },
        );
}
