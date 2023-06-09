import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/MyColors.dart';

// ignore: must_be_immutable
class GameHeader extends StatelessWidget {
  GameHeader(this.xWins, this.oWins, this.dWins, {super.key});

  int xWins = 0;
  int oWins = 0;
  int dWins = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "O",
                  style: TextStyle(color: MyColors.oColor, fontSize: 30),
                ),
                Text(
                  "$oWins wins",
                  style: TextStyle(color: MyColors.oColor, fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "X",
                  style: TextStyle(color: MyColors.xColor, fontSize: 30),
                ),
                Text(
                  "$xWins wins",
                  style: TextStyle(color: MyColors.xColor, fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/balance.png",
                  height: 30,
                  width: 30,
                  fit: BoxFit.fill,
                ),
                Text(
                  "$dWins draws",
                  style: TextStyle(color: MyColors.dColor, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
