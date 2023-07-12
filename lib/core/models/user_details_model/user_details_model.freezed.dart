// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthday')
  String get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'about')
  String get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferences')
  List<String> get preferences => throw _privateConstructorUsedError;
  @JsonKey(name: 'profilePicURL')
  String get profilePicURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'firstName') String firstName,
      @JsonKey(name: 'lastName') String lastName,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'birthday') String birthday,
      @JsonKey(name: 'about') String about,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'preferences') List<String> preferences,
      @JsonKey(name: 'profilePicURL') String profilePicURL,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'lon') double lon,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'rating') double rating});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? birthday = null,
    Object? about = null,
    Object? gender = null,
    Object? preferences = null,
    Object? profilePicURL = null,
    Object? lat = null,
    Object? lon = null,
    Object? age = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePicURL: null == profilePicURL
          ? _value.profilePicURL
          : profilePicURL // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$_UserDetailsCopyWith(
          _$_UserDetails value, $Res Function(_$_UserDetails) then) =
      __$$_UserDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'firstName') String firstName,
      @JsonKey(name: 'lastName') String lastName,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'birthday') String birthday,
      @JsonKey(name: 'about') String about,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'preferences') List<String> preferences,
      @JsonKey(name: 'profilePicURL') String profilePicURL,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'lon') double lon,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'rating') double rating});
}

/// @nodoc
class __$$_UserDetailsCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$_UserDetails>
    implements _$$_UserDetailsCopyWith<$Res> {
  __$$_UserDetailsCopyWithImpl(
      _$_UserDetails _value, $Res Function(_$_UserDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? birthday = null,
    Object? about = null,
    Object? gender = null,
    Object? preferences = null,
    Object? profilePicURL = null,
    Object? lat = null,
    Object? lon = null,
    Object? age = null,
    Object? rating = null,
  }) {
    return _then(_$_UserDetails(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePicURL: null == profilePicURL
          ? _value.profilePicURL
          : profilePicURL // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDetails implements _UserDetails {
  const _$_UserDetails(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'firstName') required this.firstName,
      @JsonKey(name: 'lastName') required this.lastName,
      @JsonKey(name: 'role') required this.role,
      @JsonKey(name: 'birthday') required this.birthday,
      @JsonKey(name: 'about') required this.about,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'preferences') required final List<String> preferences,
      @JsonKey(name: 'profilePicURL') required this.profilePicURL,
      @JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'lon') required this.lon,
      @JsonKey(name: 'age') required this.age,
      @JsonKey(name: 'rating') required this.rating})
      : _preferences = preferences;

  factory _$_UserDetails.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailsFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'firstName')
  final String firstName;
  @override
  @JsonKey(name: 'lastName')
  final String lastName;
  @override
  @JsonKey(name: 'role')
  final String role;
  @override
  @JsonKey(name: 'birthday')
  final String birthday;
  @override
  @JsonKey(name: 'about')
  final String about;
  @override
  @JsonKey(name: 'gender')
  final String gender;
  final List<String> _preferences;
  @override
  @JsonKey(name: 'preferences')
  List<String> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  @override
  @JsonKey(name: 'profilePicURL')
  final String profilePicURL;
  @override
  @JsonKey(name: 'lat')
  final double lat;
  @override
  @JsonKey(name: 'lon')
  final double lon;
  @override
  @JsonKey(name: 'age')
  final int age;
  @override
  @JsonKey(name: 'rating')
  final double rating;

  @override
  String toString() {
    return 'UserDetails(uid: $uid, email: $email, firstName: $firstName, lastName: $lastName, role: $role, birthday: $birthday, about: $about, gender: $gender, preferences: $preferences, profilePicURL: $profilePicURL, lat: $lat, lon: $lon, age: $age, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetails &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences) &&
            (identical(other.profilePicURL, profilePicURL) ||
                other.profilePicURL == profilePicURL) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      firstName,
      lastName,
      role,
      birthday,
      about,
      gender,
      const DeepCollectionEquality().hash(_preferences),
      profilePicURL,
      lat,
      lon,
      age,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      __$$_UserDetailsCopyWithImpl<_$_UserDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailsToJson(
      this,
    );
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails(
      {@JsonKey(name: 'uid') required final String uid,
      @JsonKey(name: 'email') required final String email,
      @JsonKey(name: 'firstName') required final String firstName,
      @JsonKey(name: 'lastName') required final String lastName,
      @JsonKey(name: 'role') required final String role,
      @JsonKey(name: 'birthday') required final String birthday,
      @JsonKey(name: 'about') required final String about,
      @JsonKey(name: 'gender') required final String gender,
      @JsonKey(name: 'preferences') required final List<String> preferences,
      @JsonKey(name: 'profilePicURL') required final String profilePicURL,
      @JsonKey(name: 'lat') required final double lat,
      @JsonKey(name: 'lon') required final double lon,
      @JsonKey(name: 'age') required final int age,
      @JsonKey(name: 'rating') required final double rating}) = _$_UserDetails;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$_UserDetails.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'firstName')
  String get firstName;
  @override
  @JsonKey(name: 'lastName')
  String get lastName;
  @override
  @JsonKey(name: 'role')
  String get role;
  @override
  @JsonKey(name: 'birthday')
  String get birthday;
  @override
  @JsonKey(name: 'about')
  String get about;
  @override
  @JsonKey(name: 'gender')
  String get gender;
  @override
  @JsonKey(name: 'preferences')
  List<String> get preferences;
  @override
  @JsonKey(name: 'profilePicURL')
  String get profilePicURL;
  @override
  @JsonKey(name: 'lat')
  double get lat;
  @override
  @JsonKey(name: 'lon')
  double get lon;
  @override
  @JsonKey(name: 'age')
  int get age;
  @override
  @JsonKey(name: 'rating')
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
