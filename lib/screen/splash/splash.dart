import 'package:flutter/material.dart';
import 'package:todo_app/screen/list_todo/list_todo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height,
      width: size.width,
      child: Center(
        child: Image(
            height: size.height / 8,
            image: const AssetImage('assets/images/to-do-list.png')),
      ),
    );
  }

  init() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (ctx) => const TodoList()));
  }
}
