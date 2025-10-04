import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/game_model.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                gameModel.makeMove(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    gameModel.board[index],
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
          ),
          Text(
            gameModel.winner != null
                ? '${gameModel.winner} wins!'
                : gameModel.isDraw
                    ? 'It's a draw!'
                    : 'Current turn: ${gameModel.currentPlayer}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              gameModel.resetGame();
            },
            child: Text('New Game'),
          ),
        ],
      ),
    );
  }
}
