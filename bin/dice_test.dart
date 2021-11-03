import 'package:test/test.dart';
import 'dice.dart';

void main() {
  late Dice dice;

  setUp(() {
    dice = Dice();
  });

  test('Dice has a List value', () {
    expect(dice.roll, isA<List>());
  });

  test('Dice can be added an integer', () {
    const newValue = 5;
    dice.add(newValue);
    expect(dice.roll, contains(newValue));
  });

  test('Test are independent', () {
    expect(dice.roll, isEmpty);
  });
}