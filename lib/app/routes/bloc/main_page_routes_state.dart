part of 'main_page_routes_bloc.dart';

@immutable
abstract class MainPageRoutesState {
  final int tabIndex;

  const MainPageRoutesState({required this.tabIndex});
}

class MainPageRoutesInitial extends MainPageRoutesState {
  const MainPageRoutesInitial({required super.tabIndex});
}
