part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.gender = "anyone",
    this.startAge = 20,
    this.endAge = 70,
    this.distance = 1,
    this.startTime = "",
    this.endTime = "",
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.searchResult,
  });

  final String gender;
  final int startAge;
  final int endAge;
  final int distance;
  final String startTime;
  final String endTime;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final List<UserDetails>? searchResult;

  @override
  List<Object?> get props => [
        gender,
        startAge,
        endAge,
        distance,
        startTime,
        endTime,
        status,
      ];

  SearchState copyWith({
    String? gender,
    int? startAge,
    int? endAge,
    int? distance,
    String? startTime,
    String? endTime,
    FormzSubmissionStatus? status,
    String? errorMessage,
    List<UserDetails>? searchResult,
  }) {
    return SearchState(
      gender: gender ?? this.gender,
      startAge: startAge ?? this.startAge,
      endAge: endAge ?? this.endAge,
      distance: distance ?? this.distance,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      searchResult: searchResult ?? this.searchResult,
    );
  }
}
