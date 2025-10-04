import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/models/game_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => GameModel(),
      child: MaterialApp(
        title: 'Tic-Tac-Toe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GameScreen(),
      ),
    );
  }
}
