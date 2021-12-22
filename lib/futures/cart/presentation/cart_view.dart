import 'package:flutter/material.dart';
import 'widgets/cart_body.dart';
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartBody(),
    );
  }
}
