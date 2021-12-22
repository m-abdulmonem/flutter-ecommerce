import 'package:flutter/material.dart';
import 'widgets/category_body.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryBody(),
    );
  }
}
