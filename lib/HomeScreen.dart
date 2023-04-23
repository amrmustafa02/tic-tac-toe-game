import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/MyColors.dart';
import 'package:tic_tac_toe_app/game_header.dart';
import 'package:tic_tac_toe_app/xo_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];

  List<Color> boardColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  bool xTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // header of game
          GameHeader(),
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: XOItem(
                    board[0],
                    0,
                    onClick,
                    textColor: boardColors[0],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor),
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[1],
                    1,
                    onClick,
                    textColor: boardColors[1],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor),
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[2],
                    2,
                    onClick,
                    textColor: boardColors[2],
                    itemBorder: Border(
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: XOItem(
                    board[3],
                    3,
                    onClick,
                    textColor: boardColors[3],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor),
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[4],
                    4,
                    onClick,
                    textColor: boardColors[4],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor),
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[5],
                    5,
                    onClick,
                    textColor: boardColors[5],
                    itemBorder: Border(
                        bottom:
                            BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: XOItem(
                    board[6],
                    6,
                    onClick,
                    textColor: boardColors[6],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[7],
                    7,
                    onClick,
                    textColor: boardColors[7],
                    itemBorder: Border(
                        right: BorderSide(width: 2, color: XOItem.borderColor)),
                  ),
                ),
                Expanded(
                  child: XOItem(
                    board[8],
                    8,
                    onClick,
                    textColor: boardColors[8],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              MyColors.oColor,
              MyColors.xColor,
            ])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: const Icon(Icons.repeat),
            ),
          ),
          const Spacer()
        ],
      ),
    ));
  }

  void onClick(String text, int position) {
    if (board[position].isNotEmpty) {
      return;
    }
    if (xTurn) {
      board[position] = 'X';
      boardColors[position] = MyColors.xColor;
    } else {
      board[position] = 'O';
      boardColors[position] = MyColors.oColor;
    }
    xTurn = !xTurn;
    setState(() {});
  }
}
