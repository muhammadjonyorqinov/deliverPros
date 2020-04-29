import 'package:deliverpros/models/instruction.dart';
import 'package:flutter/material.dart';



class InstructionItem extends StatelessWidget {
  final Instruction instruction;
  InstructionItem(this.instruction);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:85.0,bottom: 65),
          child: Image.asset(instruction.imageUrl,fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:50.0),
          child: Text(instruction.description,textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
