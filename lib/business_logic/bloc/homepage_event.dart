part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class LoadData extends HomepageEvent {}

class NavBack extends HomepageEvent {}
