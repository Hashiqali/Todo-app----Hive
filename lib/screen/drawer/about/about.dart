import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 22, 21, 21),
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SLASHI',
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '        Our to-do app is a sleek and intuitive task management tool designed to help you stay organized and productive. With its user-friendly interface, you can easily create, categorize, and prioritize your tasks, ensuring nothing falls through the cracks. Features such as due date reminders, progress tracking, and customizable lists make it simple to keep track of your commitments and goals. Whether you\'re managing daily chores, work projects, or long-term plans, our app provides the perfect platform to boost your efficiency and achieve more every day. Stay on top of your tasks with ease and make productivity a part of your routine with our comprehensive to-do app\n\nSincerely,\n\nHashiq Ali',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
