import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_view_model.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const App());
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, MainViewModel>(
      builder: (context, viewModel) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${viewModel.selectedColorIndex}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterBloc>().add(UpIncrementPressed());
                  },
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<CounterBloc>().add(UpDecrementPressed());
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${viewModel.selectedSizeIndex}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterBloc>().add(DownIncrementPressed());
                  },
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<CounterBloc>().add(DownDecrementPressed());
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

abstract class CounterEvent {}

class UpIncrementPressed extends CounterEvent {}

class UpDecrementPressed extends CounterEvent {}

class DownIncrementPressed extends CounterEvent {}

class DownDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, MainViewModel> {
  CounterBloc() : super(MainViewModel()) {
    on<UpIncrementPressed>((event, emit) {
      emit(state.selectColor(
          selectedColorIndex: state.selectedColorIndex + 1,
          selectedSizeIndex: 0
      ));
    });
    on<UpDecrementPressed>((event, emit) {
      emit(state.selectColor(
          selectedColorIndex: state.selectedColorIndex - 1,
          selectedSizeIndex: 0
      ));
    });
    on<DownIncrementPressed>((event, emit) {
      emit(state.selectSize(
          selectedColorIndex: state.selectedColorIndex,
          selectedSizeIndex: state.selectedSizeIndex + 1
      ));
    });
    on<DownDecrementPressed>((event, emit) {
      emit(state.selectSize(
          selectedColorIndex: state.selectedColorIndex,
          selectedSizeIndex: state.selectedSizeIndex - 1
      ));
    });
  }
}
