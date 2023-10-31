import 'package:flutter/material.dart';
import 'package:flutter_danthocode/pages/clock/clock_screen.dart';
import 'package:flutter_danthocode/pages/quiz/quiz_screen.dart';
import '../calculator/calculator.dart';
import '../notes/note_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const navigator = Navigator.push;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'danthocode',
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavigateApplication(
                  icon: Icons.calculate_outlined,
                  title: 'Calculator',
                  onTap: () {
                    navigator(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalculatorApp(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                NavigateApplication(
                  icon: Icons.today_outlined,
                  title: 'Notes',
                  onTap: () {
                    navigator(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                NavigateApplication(
                  icon: Icons.quiz_outlined,
                  title: 'Quiz',
                  onTap: () {
                    navigator(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                NavigateApplication(
                  icon: Icons.watch_later_outlined,
                  title: 'Timer',
                  onTap: () {
                    navigator(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClockScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigateApplication extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const NavigateApplication({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black87,
              width: 1.5,
            )),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 44,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
