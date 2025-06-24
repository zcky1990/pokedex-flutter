import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPageView extends StatelessWidget {
  final bool isLoading;
  final Animation<double> animation;
  const LandingPageView(
      {super.key, required this.isLoading, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isLoading
                  ? SizedBox(
                      width: 150.0,
                      child: RotationTransition(
                        turns: animation,
                        child: SvgPicture.asset(
                          'assets/image/Pokeball.svg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: 20.0,
              ),
              // Text(
              //   progressTxt,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.w700,
              //       fontSize: 20),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
