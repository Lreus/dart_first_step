import 'package:test/test.dart';

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle();
  });

  test('puzzle is not solved on no queen', () {
    expect(puzzle.isSolved(), isFalse);
  });

  test('placing a queen outside the board throw an error', () {
    List wrongPosition = [
      [0, 8],
      [9, 8],
      [1, 0],
      [1, 9]
    ];

    for (final List<int> pos in wrongPosition) {
      expect(() => puzzle.addQueen(pos[0], pos[1]), throwsArgumentError);
    }
  });
}

class Puzzle {
  bool isSolved() { return false; }

  void addQueen(int line, int column) {
    if (line <= 0 || line > 8 || column <= 0 || column > 8) {
      throw ArgumentError();
    }
  }
}