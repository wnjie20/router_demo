// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pages',
      initialRoute: '/',
      routes: {
        '/': (context) => const FlutterPage1(), // 初始Flutter页面
        '/page2': (context) => const FlutterPage2(), // Flutter页面2
      },
    );
  }
}

class FlutterPage1 extends StatelessWidget {
  const FlutterPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('This is a Flutter Page1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 跳转到Flutter Page2
            Navigator.pushNamed(context, '/page2');
          },
          child: const Text('push to page2'),
        ),
      ),
    );
  }
}

class FlutterPage2 extends StatelessWidget {
  const FlutterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Flutter默认支持侧滑返回（MaterialApp路由自带）
    return Scaffold(
      appBar: AppBar(title: const Text('This is a Flutter Page2')),
      body: const Center(
        child: Text('侧滑可返回上一页'),
      ),
    );
  }
}