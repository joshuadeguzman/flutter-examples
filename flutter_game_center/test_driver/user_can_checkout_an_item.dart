import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('user can checkout an item', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
      await driver.setSemantics(true);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
        'add dota item to cart twice and should display checkout amount of \$10.0',
        () async {
      // Arrange
      final checkoutAmountFinder = find.byValueKey("total-amount-value");
      final dotaAddToCartFinder = find.byValueKey("DOTA 2 BATTLEPASS x 1");

      // Act
      // TODO: For testing purposes only
      await Future.delayed(const Duration(seconds: 3), () {});
      await driver.tap(dotaAddToCartFinder);

      // TODO: For testing purposes only
      await Future.delayed(const Duration(seconds: 3), () {});
      await driver.tap(dotaAddToCartFinder);

      // TODO: For testing purposes only
      await Future.delayed(const Duration(seconds: 3), () {});
      await driver.tap(dotaAddToCartFinder);

      // TODO: For testing purposes only
      await Future.delayed(const Duration(seconds: 3), () {});
      await driver.tap(dotaAddToCartFinder);

      // TODO: For testing purposes only
      await Future.delayed(const Duration(seconds: 3), () {});
      await driver.tap(dotaAddToCartFinder);

      // Assert
      expect(
        await driver.getText(checkoutAmountFinder),
        "\$25.0",
      );
    });
  });
}
