import 'package:flutter/material.dart';
import 'package:flutter_game_center/components/announcements/src/announcements.dart';
import 'package:flutter_game_center/components/cart/src/cart.dart';
import 'package:flutter_game_center/components/game_title/game_title.dart';
import 'package:flutter_game_center/components/level_progress/level_progress.dart';
import 'package:flutter_game_center/components/shop_items/src/shop_items.dart';
import 'package:flutter_game_center/components/user_account/user_account.dart';
import 'package:flutter_game_center/pages/home/stores/home.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore? store;

  @override
  void didChangeDependencies() {
    store ??= Provider.of<HomeStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color(0xFF1D2243),
                BlendMode.hue,
              ),
              child: Image.asset(
                "assets/images/cod.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              height: size.height,
              width: size.width,
              color: const Color(0xFF1C2142),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 56),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.home_filled,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: const Icon(
                          Icons.mic_off,
                          color: Color(0xFFED6B74),
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: const Icon(
                          Icons.gamepad,
                          color: Color(0xFF6684E0),
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: const Icon(
                          Icons.explore,
                          color: Color(0xFF865dE9),
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    bottom: 32,
                  ),
                  child: const GameTitle(
                    title: "Flutter Game Center",
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Observer(
                        builder: (_) => AnimatedOpacity(
                          opacity: store!.testModeOpacity,
                          duration: const Duration(milliseconds: 250),
                          child: const Announcements(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Observer(
                        builder: (_) => AnimatedOpacity(
                          opacity: store!.testModeOpacity,
                          duration: const Duration(milliseconds: 250),
                          child: Column(
                            children: const [
                              LevelProgress(
                                imagePath: "assets/images/dark-voyager.png",
                                game: "Battle Royale",
                                trophies: 1925,
                                medals: 200,
                                hours: 250,
                              ),
                              SizedBox(height: 24),
                              LevelProgress(
                                imagePath: "assets/images/dota-jugger.jpg",
                                game: "Dota 2",
                                trophies: 1720,
                                medals: 309,
                                hours: 300,
                              ),
                              SizedBox(height: 24),
                              LevelProgress(
                                imagePath: "assets/images/cod-2.jpg",
                                game: "Call of Duty",
                                trophies: 250,
                                medals: 10,
                                hours: 51,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Observer(
                        builder: (_) => Container(
                          decoration: BoxDecoration(
                            boxShadow: store!.isTestMode
                                ? [
                                    const BoxShadow(
                                      offset: Offset(0, 5),
                                      color: Colors.white10,
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ]
                                : null,
                          ),
                          margin: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Observer(
                                builder: (_) => UserAccount(
                                  isTestMode: store!.isTestMode,
                                  onTestModeChanged: store!.setIsTestMode,
                                ),
                              ),
                              Observer(
                                builder: (_) => Cart(
                                  onCheckoutPressed: store!.reset,
                                  totalAmount: store!.totalAmount,
                                  itemCount: store!.totalCount,
                                ),
                              ),
                              Observer(
                                builder: (_) => ShopItems(
                                  dotaCount: store!.dotaCount,
                                  fortniteCount: store!.fortniteCount,
                                  codCount: store!.codCount,
                                  onAddItemPressed: (item, price) =>
                                      store!.addItem(item, price),
                                  onRemoveItemPressed: (item, price) =>
                                      store!.removeItem(item, price),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
