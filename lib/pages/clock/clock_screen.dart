import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

final isRestart = StateProvider((ref) => false);
final isPause = StateProvider((ref) => false);

class ClockScreen extends ConsumerWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = CountdownController();
    // final _scaffoldKey = GlobalKey<ScaffoldState>();
    final restart = ref.watch(isRestart.notifier).state;
    final pause = ref.watch(isPause.notifier).state;
    final timerState = restart ? 'Restart' : (pause ? 'Pause' : 'Play');

    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Countdown(
              controller: _controller,
              seconds: 10,
              build: ((_, double timer) {
                return Text(
                  '0${(timer ~/ 360).toInt()}:0${(timer ~/ 60).toInt()}:${timer.toString()}',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              interval: const Duration(seconds: 1),
              onFinished: () {
                ref.read(isRestart.notifier).state = !ref.read(isRestart.notifier).state;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final isComplete = _controller.isCompleted;
                isComplete! ? _controller.restart() : _controller.pause();
                if (!isComplete && !pause) _controller.resume();
                if (isComplete) {
                  ref.read(isRestart.notifier).state = false;
                } else {
                  ref.read(isPause.notifier).state = !ref.read(isPause.notifier).state;
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
                side: const BorderSide(
                  color: Colors.black26,
                  width: 1.5,
                ),
              ),
              child: Text(
                timerState,
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
