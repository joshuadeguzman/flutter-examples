import 'package:flutter/material.dart';
import 'package:flutter_game_center/components/cart/src/cart.dart';
import 'package:flutter_game_center/pages/home/home.page.dart';
import 'package:flutter_game_center/pages/home/stores/home.store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget getMaterialWidget({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

const double SCREEN_WIDTH = 99999;
const double SCREEN_HEIGHT = 99999;

void main() {
  group("cart widget tests", () {
    testWidgets(
      "update amount to \$500",
      (tester) async {
        // Arrange
        tester.binding.window.physicalSizeTestValue = const Size(
          SCREEN_WIDTH,
          SCREEN_HEIGHT,
        );

        final widget = getMaterialWidget(
          child: const Cart(
            totalAmount: 500,
          ),
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.text("\$500.0"), findsOneWidget);
      },
    );

    testWidgets(
      "update item count to 5",
      (tester) async {
        // Arrange

        // Act

        // Assert
      },
    );
  });

  group("home widget test", () {
    testWidgets(
      "tap add-to should reset the amount to zero",
      (tester) async {
        // Arrange
        tester.binding.window.physicalSizeTestValue = const Size(
          SCREEN_WIDTH,
          SCREEN_HEIGHT,
        );

        final widget = getMaterialWidget(
          child: Provider(
            create: (_) => HomeStore(),
            child: const HomePage(),
          ),
        );

        // Act
        await tester.pumpWidget(widget);

        // Getting the first item in the list, i.e. Dota priced at $5
        await tester
            .tap(find.byKey(const ValueKey("add-to-cart-button")).first);
        await tester.pump();

        // Assert
        expect(find.text("\$5.0"), findsOneWidget);
      },
    );

    testWidgets(
      "tap checkout should reset the amount to zero",
      (tester) async {
        // Arrange
        tester.binding.window.physicalSizeTestValue = const Size(
          SCREEN_WIDTH,
          SCREEN_HEIGHT,
        );

        final widget = getMaterialWidget(
          child: Provider(
            create: (_) => HomeStore(),
            child: const HomePage(),
          ),
        );

        // Act
        await tester.pumpWidget(widget);

        // Getting the first item in the list, i.e. Dota priced at $5
        await tester
            .tap(find.byKey(const ValueKey("add-to-cart-button")).first);
        await tester.pump();

        await tester.tap(find.byKey(const ValueKey("checkout-button")));
        await tester.pump();

        // Assert
        expect(find.text("\$0.0"), findsOneWidget);
      },
    );

    testWidgets(
      "tap checkout should reset the item count to zero",
      (tester) async {
        // Arrange
        // Act
        // Assert
      },
    );
  });
}
