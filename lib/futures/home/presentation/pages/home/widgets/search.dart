import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child:  Container(
        child: TextFormField(
          textInputAction: TextInputAction.search,
          onChanged: (val) {
            print(val);
          },
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(CupertinoIcons.search,color: Colors.black,),
            ),
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }
}
