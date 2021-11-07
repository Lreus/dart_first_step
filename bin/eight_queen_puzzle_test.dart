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

  test('A queen placed has a row and a column', () {
    puzzle.addQueen(2, 5);
    var expectedQueen = puzzle.queens[0];
    expect(expectedQueen.row, equals(2));
    expect(expectedQueen.column, equals(5));
  });

  test('placing two queens on same position is forbidden', () {
    const int row = 1;
    const int column = 1;

    puzzle.addQueen(row, column);
    expect(() => puzzle.addQueen(row, column), throwsA(isA<ArgumentError>()));
  });
}

class Puzzle {
  List<Queen> queens = [];

  bool isSolved() { return false; }

  void addQueen(int line, int column) {
    if (line <= 0 || line > 8 || column <= 0 || column > 8) {
      throw ArgumentError();
    }

    for (final Queen queen in queens) {
      if (line == queen.row && column == queen.column) {
        throw ArgumentError();
      }
    }
    queens.add(Queen(line, column));
  }
}

class Queen {
  int row;
  int column;

  Queen(this.row,this.column);
}