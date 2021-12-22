import 'package:flutter/material.dart';
import 'widgets/account_body.dart';
class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountBody(),
    );
  }
}
