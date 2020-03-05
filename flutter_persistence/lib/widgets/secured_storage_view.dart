// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecuredStorageViewState();
  }
}

class SecuredStorageViewState extends State<SecuredStorageView> {
  final storage = FlutterSecureStorage();
  final String KEY_API_TOKEN = 'api_token';
  String _data = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Secure storage of credential using\nflutter_secure_storage ^3.2.1+1',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Text(
          'Stores data in Keychain (for iOS) and Keystore (for Android).',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.blue,
            height: 150,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'API TOKEN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  '$_data',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Generate'),
                      onPressed: _generateApiToken,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(
                      child: Text('Save'),
                      onPressed: _saveApiToken,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(
                      child: Text('Read'),
                      onPressed: _readApiToken,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _generateApiToken() {
    var desiredLength = 25;
    var rand = new Random();
    var randomString = new List.generate(desiredLength, (index) {
      return rand.nextInt(33) + 89;
    });

    setState(() {
      // Retrieve generated string
      _data = String.fromCharCodes(randomString);

      // Log
      print("Succesfully generated $_data");

      // Display data to the user
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Generated string is $_data'),
          duration: Duration(milliseconds: 1000),
        ),
      );
    });
  }

  _saveApiToken() async {
    await storage.write(key: KEY_API_TOKEN, value: _data);

    // Log
    print("Succesfully saved $_data");

    // Display data to the user
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Data successfully saved'),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  _readApiToken() async {
    String apiToken = await storage.read(key: KEY_API_TOKEN);

    setState(() {
      // Assign the retrieve data locally via synchronous call
      _data = apiToken;

      // Log
      print("Succesfully retrieved $_data");

      // Display data to the user
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Data retrieved is $_data'),
          duration: Duration(milliseconds: 1000),
        ),
      );
    });
  }
}
