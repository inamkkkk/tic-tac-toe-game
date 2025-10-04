import 'package:flutter/material.dart';

class GameModel extends ChangeNotifier {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String? winner;
  bool isDraw = false;

  void makeMove(int index) {
    if (board[index] == '' && winner == null && !isDraw) {
      board[index] = currentPlayer;
      _checkWinner();
      _switchPlayer();
      notifyListeners();
    }
  }

  void _switchPlayer() {
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  void _checkWinner() {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      final a = board[combination[0]];
      final b = board[combination[1]];
      final c = board[combination[2]];

      if (a != '' && a == b && a == c) {
        winner = a;
        break;
      }
    }
    if (winner == null && !board.contains('')){
      isDraw = true;
    }
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = null;
    isDraw = false;
    notifyListeners();
  }
}
