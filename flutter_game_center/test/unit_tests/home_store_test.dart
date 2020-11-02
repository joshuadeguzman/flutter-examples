import 'package:flutter_game_center/pages/home/stores/home.store.dart';
import 'package:test/test.dart';

void main() {
  group(
    "add dota item",
    () {
      test(
        "add dota item to the card should increase total dota items count",
        () {
          // Assert
          final store = HomeStore();

          // Act
          store.addItem("dota", 5);

          // Arrange
          expect(store.dotaCount, 1);
        },
      );
      test(
        "add dota item to the card should increase total combined items count",
        () {
          // Assert
          final store = HomeStore();

          // Act
          store.addItem("dota", 5);

          // Arrange
          expect(store.totalCount, 1);
        },
      );

      test(
        "add dota item to the card should increase total amount to \$5",
        () {
          // Assert
          final store = HomeStore();

          // Act
          store.addItem("dota", 5);

          // Arrange
          expect(store.totalAmount, 5);
        },
      );
    },
  );

  group(
    "add fortnite item",
    () {
      test(
        "add fornite item to the card should increase total fortnite items count",
        () {
          // Assert
          // Act
          // Arrange
        },
      );
      test(
        "add fornite item to the card should increase total combined items count",
        () {
          // Assert
          // Act
          // Arrange
        },
      );

      test(
        "add fornite item to the card should increase total amount to \$10",
        () {
          // Assert
          // Act
          // Arrange
        },
      );
    },
  );

  group(
    "add cod item",
    () {
      test(
        "add cod item to the card should increase total cod items count to 1",
        () {
          // Assert
          // Act
          // Arrange
        },
      );
      test(
        "add cod item to the card should increase total combined items count to 1",
        () {
          // Assert
          // Act
          // Arrange
        },
      );

      test(
        "add cod item to the card should increase total amount to \$5",
        () {
          // Assert
          // Act
          // Arrange
        },
      );
    },
  );
}
