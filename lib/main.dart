import 'package:flutter/material.dart';
import 'package:flutter_application_1bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.dark,
          ),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print('build1');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  int radius = state.count;
                  return CircleAvatar(
                    radius: radius.toDouble(),
                    backgroundColor: Colors.deepOrange,
                    child: Text(
                      '${state.count}',
                      style: TextStyle(fontSize: radius.toDouble()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Ingrement());
              //BlocProvider.of<CounterBloc>(context).add(Ingrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 2),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Decrement());
              //BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            tooltip: 'decriment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
