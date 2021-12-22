import 'package:flutter/cupertino.dart';

import 'widgets/resgister_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: GestureDetector(child: Icon(CupertinoIcons.chevron_back), onTap: ()=> Navigator.pop(context),),
      ),
      body: RegisterBody(),
    );
  }
}
