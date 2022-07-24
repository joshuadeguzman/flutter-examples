import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({
    Key? key,
    this.onCheckoutPressed,
    required this.totalAmount,
    this.itemCount,
  }) : super(key: key);

  final VoidCallback? onCheckoutPressed;
  final double totalAmount;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF343962),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 5),
            spreadRadius: 10,
            blurRadius: 15,
            color: Color(0x50343962),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 48,
                color: Colors.white,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 4,
                    left: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$$totalAmount",
                        // TODO: For later use
                        key: const ValueKey("total-amount-value"),
                        style: GoogleFonts.exo2().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            "Total Items: ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$itemCount",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0x801DD8A1),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x801DD8A1),
                      offset: Offset(0, 2.5),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: TextButton(
                  key: const ValueKey("checkout-button"),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  onPressed: onCheckoutPressed,
                  child: Text(
                    "CHECKOUT",
                    style: GoogleFonts.exo2().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
