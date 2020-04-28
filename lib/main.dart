import 'package:flutter/material.dart';
import 'package:tictactoe/game.dart';

void main() => runApp(MaterialApp(
  home: Game(),
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  debugShowCheckedModeBanner: false,
));
