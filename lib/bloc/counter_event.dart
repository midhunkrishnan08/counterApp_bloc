part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class Ingrement extends CounterEvent {}

class Decrement extends CounterEvent {}
