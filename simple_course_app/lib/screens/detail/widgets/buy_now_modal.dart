import 'package:flutter/material.dart';

class BuyNowModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              debugPrint("cart tap");

              // TODO: Add a widget parameter callback here
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFEDEE),
                borderRadius: BorderRadius.circular(32),
              ),
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/images/shopping_bag.png"),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: InkWell(
              onTap: () {
                debugPrint("buy now tap");

                // TODO: Add a widget parameter callback here
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF6E8AFA),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  "Buy Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
