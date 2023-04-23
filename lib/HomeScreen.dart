import 'package:flutter/cupertino.dart';
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
  String currentPlayer = '';
  int xWins = 0;
  int oWins = 0;
  int dWins = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // header of game
            GameHeader(xWins, oWins, dWins),
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
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor),
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
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor),
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
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor),
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
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor),
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
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor)),
                    ),
                  ),
                  Expanded(
                    child: XOItem(
                      board[7],
                      7,
                      onClick,
                      textColor: boardColors[7],
                      itemBorder: Border(
                          right:
                              BorderSide(width: 2, color: XOItem.borderColor)),
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
                onPressed: () {
                  returnToStartState();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Icon(Icons.repeat),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    ));
  }

  void onClick(String text, int position) {
    setState(() {


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

      if(checkDraw()){
        dWins++;
        returnToStartState();
        return;
      }

      if (!checkIsWinner()) {
        xTurn = !xTurn;
        return;
      }


      if (xTurn) {
        xWins++;
      } else {
        oWins++;
      }
      returnToStartState();
    });
  }

  bool checkIsWinner() {
    currentPlayer = xTurn ? "X" : "O";
    return checkHorizontal(currentPlayer) ||
        checkVertical(currentPlayer) ||
        checkAxis(currentPlayer);
  }

  bool checkHorizontal(String curPlayer) {
    int start = 0;
    for (int i = 0; i < 3; i++, start += 3) {
      if (board[start] == board[start + 1] &&
          board[start + 1] == board[start + 2] &&
          board[start + 2] == curPlayer) {
        currentPlayer = curPlayer;
        return true;
      }
    }
    return false;
  }

  bool checkVertical(String curPlayer) {
    int start = 0;
    for (int i = 0; i < 3; i++, start++) {
      if (board[start] == board[start + 3] &&
          board[start + 3] == board[start + 6] &&
          board[start + 6] == curPlayer) {
        currentPlayer = curPlayer;
        return true;
      }
    }
    return false;
  }

  bool checkAxis(String curPlayer) {
    if (board[0] == board[4] && board[4] == board[8] && board[8] == curPlayer) {
      return true;
    }
    if (board[2] == board[4] && board[4] == board[6] && board[6] == curPlayer) {
      return true;
    }
    return false;
  }

  void returnToStartState() {
    setState(() {
      board = ['', '', '', '', '', '', '', '', ''];
      boardColors = [
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
      xTurn = true;
      currentPlayer = '';
    });
  }

  void showAlertDialog(String winner) {
    CupertinoAlertDialog(
      content: Text(winner),
    );
  }

  // check draw
  bool checkDraw() {
    for (int i = 0; i < 9; i++) {
      if (board[i] == '') {
        return false;
      }
    }
    return true;
  }
}
