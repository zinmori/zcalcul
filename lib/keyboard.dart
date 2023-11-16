import 'package:zcalcul/digit_button.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    required this.onUpdateInput,
    required this.onUpdateOutput,
    required this.onResetInput,
    required this.onDeleteInput,
    required this.onPressAns,
  });
  final void Function(String input) onUpdateInput;
  final void Function() onUpdateOutput;
  final void Function() onResetInput;
  final void Function() onDeleteInput;
  final void Function() onPressAns;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final digit in ['7', '4', '1', '%'])
                  DigitButton(
                    onClick: () {
                      onUpdateInput(digit);
                    },
                    digit: digit,
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final digit in ['8', '5', '2', '0'])
                  DigitButton(
                    onClick: () {
                      onUpdateInput(digit);
                    },
                    digit: digit,
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final digit in ['9', '6', '3', '.'])
                  DigitButton(
                    onClick: () {
                      onUpdateInput(digit);
                    },
                    digit: digit,
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: onDeleteInput,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: 55,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      'DEL',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                DigitButton(
                    onClick: () {
                      onUpdateInput('x');
                    },
                    digit: 'x'),
                DigitButton(
                    onClick: () {
                      onUpdateInput('+');
                    },
                    digit: '+'),
                DigitButton(
                  onClick: onPressAns,
                  digit: 'Ans',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: onResetInput,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: 55,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      'AC',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                DigitButton(
                    onClick: () {
                      onUpdateInput('/');
                    },
                    digit: '/'),
                DigitButton(
                    onClick: () {
                      onUpdateInput('-');
                    },
                    digit: '-'),
                DigitButton(
                  onClick: onUpdateOutput,
                  digit: '=',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
