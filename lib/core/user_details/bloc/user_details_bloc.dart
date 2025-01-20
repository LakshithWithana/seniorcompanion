// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
// import 'package:newseniiorcompaniion/core/type_defs/type_defs.dart';
// import 'package:newseniiorcompaniion/core/user_details/data/repository/user_details_repository.dart';

// part 'user_details_event.dart';
// part 'user_details_state.dart';

// class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
//   final UserDetailsRepository userDetailsRepository;
//   UserDetailsBloc({required this.userDetailsRepository})
//       : super(UserDetailsInitialState()) {
//     on<ListenToUserDetailsEvent>(_listenToUserDetails);
//   }

//   _listenToUserDetails(ListenToUserDetailsEvent event, Emitter emit) async {
//     emit(UserDetailsLoadingState());
//     final response = await userDetailsRepository.listenToUserDetails();

//     response.fold((l) {
//       emit(UserDetailsErrorState(message: l.toString()));
//     }, (r) {
//       emit(UserDetailsLoadedState(userDetails: r));
//     });
//   }
// }
