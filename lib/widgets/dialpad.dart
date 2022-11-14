import 'package:flutter/material.dart';
import 'package:o3_cards/ui/pallete.dart';

// ignore: must_be_immutable
class Dialpad extends StatefulWidget {
  ValueChanged<String>? addValue, remove;
  Function press;
  String lastnumber;
  Color color;

  Dialpad(
      {Key? key,
      this.addValue,
      this.remove,
      this.lastnumber = "",
      required this.press,
      this.color = Colors.black})
      : super(key: key);

  @override
  _DialpadState createState() => _DialpadState();
}

class _DialpadState extends State<Dialpad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("1"),
            const SizedBox(
              width: 30,
            ),
            button("2"),
            const SizedBox(
              width: 30,
            ),
            button("3"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("4"),
            const SizedBox(
              width: 30,
            ),
            button("5"),
            const SizedBox(
              width: 30,
            ),
            button("6"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("7"),
            const SizedBox(
              width: 30,
            ),
            button("8"),
            const SizedBox(
              width: 30,
            ),
            button("9"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buttonwidget(
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: FvColors.offwhitepink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(120),
                  ),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              number: () {
                widget.remove!("");
              },
            ),
            const SizedBox(
              width: 30,
            ),
            button("0"),
            const SizedBox(
              width: 30,
            ),
            buttonwidget(
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: FvColors.maintheme,
                  borderRadius: BorderRadius.all(
                    Radius.circular(120),
                  ),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              number: () {
                widget.press();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget button(number) {
    return buttonwidget(
      child: Text(
        number,
        style: TextStyle(
            color: widget.color, fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
      number: () {
        widget.addValue!(number);
      },
    );
  }

  Widget buttonwidget({Widget? child, Function? number}) {
    return TextButton(
      // style: ButtonStyle(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(120)),
      //   ),
      //   height: 80,
      //   minWidth: 80,
      //   splashColor: Colors.blue[50],
      // ),
      onPressed: () async {
        number!();
      },
      child: child!,
    );
  }
}
