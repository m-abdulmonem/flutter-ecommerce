import 'package:flutter/material.dart';
import 'widgets/product_body.dart';
class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductBody(),
    );
  }
}
