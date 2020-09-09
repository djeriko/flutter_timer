import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/timer_bloc.dart';

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    TimerBloc timerBloc,
  }) {
    final TimerState currentState = timerBloc.state;
    if (currentState is TimerInitial) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              timerBloc.add(TimerStarted(duration: currentState.duration)),
        )
      ];
    }
    if (currentState is TimerRunInProgress) {
      return [
        FloatingActionButton(
            onPressed: () => timerBloc.add(TimerPaused()),
            child: Icon(Icons.pause)),
        FloatingActionButton(
            onPressed: () => timerBloc.add(TimerReset()),
            child: Icon(Icons.replay))
      ];
    }
    if (currentState is TimerRunPause) {
      return [
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerResumed()),
          child: Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerReset()),
          child: Icon(Icons.replay),
        )
      ];
    }
    return [];
  }
}
