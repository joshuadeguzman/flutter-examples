import 'package:flutter/material.dart';
import 'package:flutter_dribbble_nike_sb/common/constants/constants.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_cta_button.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_network_image.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_showcase_product.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _nikeLogoScaleAnimation;
  Animation<Offset> _nikeLogoOffsetAnimation;
  Animation<double> _leftBackgroundWidthAnimation;
  Animation<double> _rightBackgroundWidthAnimation;
  Animation<Offset> _productNameOffsetAnimation;
  Animation<Offset> _productPriceOffsetAnimation;
  Animation<Offset> _productSliderOffsetAnimation;
  Animation<Offset> _productDescriptionOffsetAnimation;
  Animation<Offset> _ctaOffsetAnimation;
  Animation<Offset> _productShowcaseOffsetAnimation;
  Animation<Offset> _display1OffsetAnimation;
  Animation<Offset> _display2OffsetAnimation;
  Animation<Offset> _display3OffsetAnimation;
  Animation<Offset> _display4OffsetAnimation;

  double _shoeSize = 39;

  bool _isAnimationTriggered = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _nikeLogoScaleAnimation = Tween<double>(
      begin: 2.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );
    _nikeLogoOffsetAnimation = Tween<Offset>(
      begin: Offset(150, 110),
      end: Offset(20, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.125,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _leftBackgroundWidthAnimation = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _rightBackgroundWidthAnimation = Tween<double>(
      begin: 900,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _productNameOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 1000),
      end: Offset(0, 125),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          0.750,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productPriceOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 1000),
      end: Offset(0, 200),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.125,
          0.800,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productSliderOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 1000),
      end: Offset(0, 300),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.250,
          0.900,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productDescriptionOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 1000),
      end: Offset(0, 375),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.350,
          0.950,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _ctaOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 1000),
      end: Offset(0, 500),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.450,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productShowcaseOffsetAnimation = Tween<Offset>(
      begin: Offset(3000, 20),
      end: Offset(0, 20),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          0.750,
          curve: Curves.ease,
        ),
      ),
    );

    _display1OffsetAnimation = Tween<Offset>(
      begin: Offset(3000, 450),
      end: Offset(60, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.125,
          0.500,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display2OffsetAnimation = Tween<Offset>(
      begin: Offset(3000, 450),
      end: Offset(160, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.350,
          0.850,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display3OffsetAnimation = Tween<Offset>(
      begin: Offset(3000, 450),
      end: Offset(260, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.450,
          0.950,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display4OffsetAnimation = Tween<Offset>(
      begin: Offset(3000, 450),
      end: Offset(360, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.550,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040404),
      body: Stack(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Color(0xFF0D0D0D),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Color(0xFF101010),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xFF202020),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Color(0xFFFF2D4C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget child) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            height: 650,
                            width: 900,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  color: Color(0xFF121212),
                                  width: _leftBackgroundWidthAnimation.value,
                                ),
                                Container(
                                  color: Color(0xFF0D0D0D),
                                  width: _rightBackgroundWidthAnimation.value,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 650,
                            width: 900,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 650,
                                  width: 400,
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Stack(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset:
                                            _productNameOffsetAnimation.value,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SelectableText(
                                              "LEBRON SOLDIER XIII",
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SelectableText(
                                              "BUILT FOR SPEED",
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productPriceOffsetAnimation.value,
                                        child: SelectableText(
                                          "\$150",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 48,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productSliderOffsetAnimation.value,
                                        child: AppSlider(
                                          min: 39,
                                          max: 45,
                                          divisions: 6,
                                          sliderValue: _shoeSize,
                                          sliderSteps: [
                                            39,
                                            40,
                                            41,
                                            42,
                                            43,
                                            44,
                                            45
                                          ],
                                          onChangedValue: (double value) {
                                            setState(() {
                                              _shoeSize = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productDescriptionOffsetAnimation
                                                .value,
                                        child: SelectableText(
                                          "There's no player more battle-tested than LeBron James. Build for speed, with responsive cushioning and lightweight lockdown, the Lebron Soldier XIII is the next iteration of custom reinforcement for on-court dominance.",
                                          style: TextStyle(
                                            color: Color(0xFF909090),
                                            fontSize: 10,
                                            height: 2,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _ctaOffsetAnimation.value,
                                        child: AppCtaButton(
                                          title: 'Buy Now',
                                          onCtaTap: (bool isTapped) {
                                            // TODO: UX/logic setup for demo only :)
                                            // Show some delay
                                            Future.delayed(
                                              Duration(seconds: 1),
                                              () {
                                                setState(() {
                                                  _isAnimationTriggered =
                                                      !_isAnimationTriggered;
                                                });

                                                _animationController.reverse();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  height: 650,
                                  child: Stack(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: _productShowcaseOffsetAnimation
                                            .value,
                                        child: Container(
                                          height: 450,
                                          child: Stack(
                                            children: <Widget>[
                                              Center(
                                                child: AppShowCaseProduct(
                                                  productSize: _shoeSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display1OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            border: Border.all(
                                                width: 5,
                                                color: Colors.black87),
                                          ),
                                          child: AppNetworkImage(
                                            imagePath: AssetConstants.nikeShowcase1,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display2OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            border: Border.all(
                                                width: 5,
                                                color: Colors.black87),
                                          ),
                                          child: AppNetworkImage(
                                            imagePath: AssetConstants.nikeShowcase2,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display3OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            border: Border.all(
                                                width: 5,
                                                color: Colors.black87),
                                          ),
                                          child: AppNetworkImage(
                                            imagePath: AssetConstants.nikeShowcase3,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display4OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            border: Border.all(
                                                width: 5,
                                                color: Colors.black87),
                                          ),
                                          child: AppNetworkImage(
                                            imagePath: AssetConstants.nikeShowcase4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: _nikeLogoScaleAnimation.value,
                            child: Transform.translate(
                              offset: _nikeLogoOffsetAnimation.value,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isAnimationTriggered =
                                        !_isAnimationTriggered;
                                  });

                                  if (_isAnimationTriggered) {
                                    _animationController.forward();
                                  } else {
                                    _animationController.reverse();
                                  }
                                },
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: AppNetworkImage(
                                    imagePath: AssetConstants.nikeLogo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
