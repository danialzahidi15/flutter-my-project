import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/home/screen/home_page.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const navigator = Navigator.push;
    return Container(
      height: size.height,
      width: size.height,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'danthocode',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                navigator(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              child: Text(
                'Press to enter',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 1.2,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
