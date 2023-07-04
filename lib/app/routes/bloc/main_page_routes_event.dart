part of 'main_page_routes_bloc.dart';

@immutable
abstract class MainPageRoutesEvent {}

class TabChange extends MainPageRoutesEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
