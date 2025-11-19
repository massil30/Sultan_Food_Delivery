import 'package:flutter/material.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(backgroundColor: context.c_background,), body: Container(
      
      child: Column(mainAxisAlignment: .start,)),);
  }
}
