import 'package:ecommerce/core/util/constant.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hint, label;
  final Color? color,
      hintColor,
      labelColor,
      prefixIconColor;
  final bool? obscureText, autofocus;
  final TextStyle? labelStyle, hintStyle, style;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final prefixIcon;
  final double? radius;

  CustomInput(
      {Key? key,
      this.hint,
      this.label,
      this.color,
      this.hintColor,
      this.labelColor,
      this.prefixIconColor,
      this.obscureText,
      this.autofocus,
      this.labelStyle,
      this.hintStyle,
      this.style,
      this.controller,
      this.textInputAction,
      this.inputType,
      this.onSave,
      this.validator,
      this.prefixIcon,
      this.radius})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<CustomInput> {
  final focusColor =  Color(0xff000000).withOpacity(0.5);
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) =>
          setState(() => hasFocus ? focusColor : widget.color),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.none,
        keyboardType: widget.inputType ?? TextInputType.text,
        style: widget.style ?? TextStyle(),
        obscureText: widget.obscureText ?? false,
        onSaved: widget.onSave,
        validator: widget.validator,
        autofocus: widget.autofocus ?? false,
        decoration: InputDecoration(
            focusColor: focusColor,
            focusedBorder: focusedBorder,
            border: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: errorInputBorder,
            labelText: widget.label,
            errorStyle: TextStyle(
                color: ColorError, fontSize: 15),
            labelStyle: widget.labelStyle ??
                TextStyle(
                  fontSize: 18,
                  color: _focusNode!.hasFocus
                      ? focusColor
                      : widget.labelColor,
                ),
            hintText: widget.hint,
            hintStyle: widget.hintStyle ??
                TextStyle(
                    color: _focusNode!.hasFocus
                        ? focusColor
                        : widget.hintColor)),
      ),
    );
  }

  FocusNode? _focusNode;

  late UnderlineInputBorder inputBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffDDDDDD)));
  late UnderlineInputBorder focusedBorder =
  UnderlineInputBorder(borderSide: BorderSide(color: ColorPrimary));
  late UnderlineInputBorder errorInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorError,
      width: 2.0,
    ),
  );

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    super.dispose();
  }
}
