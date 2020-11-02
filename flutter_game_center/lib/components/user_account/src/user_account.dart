import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({
    Key key,
    this.isTestMode,
    this.onTestModeChanged,
  }) : super(key: key);

  final bool isTestMode;
  final Function(bool value) onTestModeChanged;

  @override
  State<StatefulWidget> createState() {
    return _UserAccountState();
  }
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF343962),
        boxShadow: [
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
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.all(24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/joshua.png"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "@joshuamdeguzman",
                        style: GoogleFonts.exo2().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Skywalker of the North",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "TEST MODE",
                    style: GoogleFonts.exo2().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                  Switch(
                    value: widget.isTestMode,
                    onChanged: (value) => widget.onTestModeChanged(value),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
