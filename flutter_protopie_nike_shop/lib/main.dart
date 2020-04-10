// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_protopie_nike_shop/contants.dart';
import 'package:flutter_protopie_nike_shop/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
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
  List<Product> _products = [];
  PageController _pageController;
  double _currentPage = 0;
  String _productCategory = 'TRAINING';

  AnimationController _animationController;
  Animation<Offset> _searchOffsetAnimation;
  Animation<Offset> _cartOffsetAnimation;
  Animation<double> _nikeLogoOffsetAnimation;
  Animation<Offset> _productBackgroundOffsetAnimation;
  Animation<Offset> _productOffsetAnimation;

  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {
          _currentPage = _pageController.page;
        });
      });

    // Initialize products
    final product1 = Product(
      title: 'Nike PhantomVNM\nClub FG',
      subtitle: 'PHANTOM PROJECT',
      price: '\$69.99',
      category: 'Football',
      imageUrl: AssetConstants.phantom,
    );
    final product2 = Product(
      title: 'Nike Epic\nReact Flyknit 2',
      subtitle: 'EPIC REACT',
      price: '\$79.99',
      category: 'Running',
      imageUrl: AssetConstants.flyKnit,
    );
    final product3 = Product(
      title: 'Nike Air Zoom\nPegasus 36',
      subtitle: 'ZOOM PROJECT',
      price: '\$89.99',
      category: 'Running',
      imageUrl: AssetConstants.pegasus36,
    );
    final product4 = Product(
      title: 'Nike Zoom\nPegasus Turbo 2',
      subtitle: 'ZOOM PROJECT',
      price: '\$99.99',
      category: 'Running',
      imageUrl: AssetConstants.pegasusZoom,
    );

    _products.addAll([product1, product2, product3, product4]);

    // Prepare animations
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    _nikeLogoOffsetAnimation = Tween<double>(
      begin: -1000,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
      ),
    );

    // Prepare entrance animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF3F3F3),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height * 0.60,
                      width: size.width,
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _products.length,
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) {
                          _productCategory = _products[index].category;

                          if (index == _currentPage.floor()) {
                            return PageItemView(
                              product: _products[index],
                              index: index,
                              page: _currentPage,
                              alignment: FractionalOffset.centerRight,
                            );
                          } else if (index == _currentPage.floor() + 1) {
                            return PageItemView(
                              product: _products[index],
                              index: index,
                              page: _currentPage,
                              alignment: FractionalOffset.centerLeft,
                            );
                          } else {
                            return PageItemView(
                              product: _products[index],
                              index: index,
                              page: _currentPage,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(
                    size.width / 2 - 25,
                    _nikeLogoOffsetAnimation.value,
                  ),
                  child: Container(
                    height: 100,
                    width: 50,
                    child: Image.network(AssetConstants.nikeAppLogo),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 48,
                      left: 32,
                      right: 32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          size: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isAnimated = !_isAnimated;
                            });

                            if (_isAnimated) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          },
                          child: Text(
                            _productCategory.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageItemView extends StatefulWidget {
  final double _defaultItemHeight = 500;
  final double _defaultPerspective = 0.002;
  final double _defaultAngle = pi / 2;
  final double _defaultProductAngle = -1;
  final Alignment _defaultAlignment = FractionalOffset.center;

  final double itemHeight;
  final Product product;
  final int index;
  final double page;
  final double perspective;
  final double angle;
  final double productAngle;
  final Alignment alignment;

  const PageItemView({
    Key key,
    @required this.product,
    @required this.index,
    @required this.page,
    this.itemHeight,
    this.perspective,
    this.angle,
    this.productAngle,
    this.alignment,
  })  : assert(index != null, 'index must not be null!'),
        assert(index != null, 'page must not be null!'),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageItemViewState();
  }
}

class _PageItemViewState extends State<PageItemView> {
  double get _itemHeight => widget.itemHeight ?? widget._defaultItemHeight;
  Alignment get _alignment => widget.alignment ?? widget._defaultAlignment;
  Product get _product => widget.product;
  int get _index => widget.index ?? 0;
  double get _page => widget.page ?? 0;
  double get _perspective => widget.perspective ?? widget._defaultPerspective;
  double get _angle => widget.angle ?? widget._defaultAngle;
  double get _productAngle => widget.angle ?? widget._defaultProductAngle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _alignment != null
              ? Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, _perspective)
                    ..scale(1 - lerpDouble(0, -0.25, _index - _page))
                    ..rotateY(_angle * (_page - _index)),
                  alignment: _alignment,
                  child: _buildBackground(_itemHeight),
                )
              : _buildBackground(_itemHeight),
          Transform.translate(
            offset: Offset(0, -20),
            child: Transform.rotate(
              angle: _productAngle * (_page - _index),
              child: Container(
                height: 160,
                child: Center(
                  child: Transform.rotate(
                    angle: 276,
                    child: Image.network(_product.imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(double height) {
    return Container(
      height: height,
      width: 250,
      margin: const EdgeInsets.all(32),
      // TODO: Apparently, box shadow is slow in this transition. Action item: Investigate and file an issue
      // boxShadow: [
      //   BoxShadow(
      //     offset: Offset(0, 0),
      //     color: Color(0xFFE3E3E3),
      //     blurRadius: 30,
      //   ),
      // ],
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              height: height,
              color: Colors.white,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  _product.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Text(
                      _product.subtitle.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            _product.price.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          color: Color(0xFF232323),
                          child: Icon(
                            Icons.add,
                            color: Colors.white30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
