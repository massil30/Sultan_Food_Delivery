import 'package:flutter/material.dart';
import 'package:flutter_setup_project/utils/extensions/text.dart';
import 'package:flutter_setup_project/utils/theme_extensions.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Text('test', style: context.h2);
  }
}
