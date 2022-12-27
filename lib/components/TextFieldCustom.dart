
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {

  final String label;
  final TextEditingController controller;
  final Function(String) FiltrarLista;
   TextFieldCustom(this.FiltrarLista,this.label, this.controller, {Key? key})
      : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
          maxLines: 1,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          controller: widget.controller,
          onChanged: widget.FiltrarLista,
          decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).appBarTheme.backgroundColor,
              enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Theme.of(context).bottomAppBarColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),

              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10),
              ),
              label: Text(widget.label),
              floatingLabelStyle: Theme.of(context).textTheme.bodyText1)
    );
  }
}
