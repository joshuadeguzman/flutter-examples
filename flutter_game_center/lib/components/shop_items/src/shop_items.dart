import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItems extends StatelessWidget {
  const ShopItems({
    Key key,
    this.dotaCount = 0,
    this.fortniteCount = 0,
    this.codCount = 0,
    this.onAddItemPressed,
    this.onRemoveItemPressed,
  }) : super(key: key);

  // TODO: Can be made dynamic
  final int dotaCount;
  final int fortniteCount;
  final int codCount;

  // TODO: Can be converted to model
  final Function(
    String item,
    int price,
  ) onAddItemPressed;
  final Function(
    String item,
    int price,
  ) onRemoveItemPressed;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      children: [
        _ShopItem(
          title: "DOTA 2 BATTLEPASS x 1",
          imagePath: "assets/images/dota-2.png",
          price: 5,
          count: dotaCount,
          onAddItemPressed: onAddItemPressed,
          onRemoveItemPressed: onRemoveItemPressed,
        ),
        _ShopItem(
          title: "FORTNITE BATTLEPASS x 1",
          imagePath: "assets/images/fortnite.png",
          price: 10,
          count: fortniteCount,
          onAddItemPressed: onAddItemPressed,
          onRemoveItemPressed: onRemoveItemPressed,
        ),
        _ShopItem(
          title: "CALL OF DUTY BATTLE PASS X 1",
          imagePath: "assets/images/call-of-duty.png",
          price: 5,
          count: codCount,
          onAddItemPressed: onAddItemPressed,
          onRemoveItemPressed: onRemoveItemPressed,
        ),
      ],
    );
  }
}

class _ShopItem extends StatelessWidget {
  const _ShopItem({
    Key key,
    this.onAddItemPressed,
    this.onRemoveItemPressed,
    this.title,
    this.imagePath,
    this.price,
    this.count = 0,
  }) : super(key: key);

  final Function(
    String item, // TODO: Can be converted to model
    int price,
  ) onAddItemPressed;
  final Function(
    String item,
    int price,
  ) onRemoveItemPressed;
  final String title;
  final String imagePath;
  final int price;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF343962),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: Image.asset(imagePath),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    title,
                    style: GoogleFonts.exo2().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "\$$price",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5AB35),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFAF5AB35),
                          offset: Offset(0, 2.5),
                          blurRadius: 7.5,
                          spreadRadius: 1.5,
                        ),
                      ],
                    ),
                    child: FlatButton(
                      // key: ValueKey("add-to-cart-button"),
                      // TODO: For later use
                      key: ValueKey(title),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      onPressed: () => onAddItemPressed(title, price),
                      child: Text(
                        "ADD TO CART",
                        style: GoogleFonts.exo2().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  AnimatedOpacity(
                    opacity: count > 0 ? 1 : 0,
                    duration: Duration(milliseconds: 250),
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xFFED6B74),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFED6B74),
                            offset: Offset(0, 2.5),
                            blurRadius: 7.5,
                            spreadRadius: 1.5,
                          ),
                        ],
                      ),
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        onPressed: () => onRemoveItemPressed(title, price),
                        child: Text(
                          "REMOVE 1",
                          style: GoogleFonts.exo2().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
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
