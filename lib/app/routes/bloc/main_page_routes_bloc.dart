import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_routes_event.dart';
part 'main_page_routes_state.dart';

class MainPageRoutesBloc
    extends Bloc<MainPageRoutesEvent, MainPageRoutesState> {
  MainPageRoutesBloc() : super(const MainPageRoutesInitial(tabIndex: 0)) {
    on<MainPageRoutesEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(MainPageRoutesInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
