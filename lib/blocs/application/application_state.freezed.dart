// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicationStateTearOff {
  const _$ApplicationStateTearOff();

  Initial init() {
    return const Initial();
  }

  AppStarted appStarted() {
    return const AppStarted();
  }

  Loading loading() {
    return const Loading();
  }

  UserLoaded userLoaded(User? user) {
    return UserLoaded(
      user,
    );
  }

  Error error(String message) {
    return Error(
      message,
    );
  }
}

/// @nodoc
const $ApplicationState = _$ApplicationStateTearOff();

/// @nodoc
mixin _$ApplicationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  final ApplicationState _value;
  // ignore: unused_field
  final $Res Function(ApplicationState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$ApplicationStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ApplicationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Initial implements ApplicationState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $AppStartedCopyWith<$Res> {
  factory $AppStartedCopyWith(
          AppStarted value, $Res Function(AppStarted) then) =
      _$AppStartedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStartedCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res>
    implements $AppStartedCopyWith<$Res> {
  _$AppStartedCopyWithImpl(AppStarted _value, $Res Function(AppStarted) _then)
      : super(_value, (v) => _then(v as AppStarted));

  @override
  AppStarted get _value => super._value as AppStarted;
}

/// @nodoc

class _$AppStarted implements AppStarted {
  const _$AppStarted();

  @override
  String toString() {
    return 'ApplicationState.appStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) {
    return appStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) {
    return appStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) {
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) {
    return appStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class AppStarted implements ApplicationState {
  const factory AppStarted() = _$AppStarted;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$ApplicationStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ApplicationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ApplicationState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $UserLoadedCopyWith<$Res> {
  factory $UserLoadedCopyWith(
          UserLoaded value, $Res Function(UserLoaded) then) =
      _$UserLoadedCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class _$UserLoadedCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res>
    implements $UserLoadedCopyWith<$Res> {
  _$UserLoadedCopyWithImpl(UserLoaded _value, $Res Function(UserLoaded) _then)
      : super(_value, (v) => _then(v as UserLoaded));

  @override
  UserLoaded get _value => super._value as UserLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserLoaded(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$UserLoaded implements UserLoaded {
  const _$UserLoaded(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'ApplicationState.userLoaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserLoaded &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $UserLoadedCopyWith<UserLoaded> get copyWith =>
      _$UserLoadedCopyWithImpl<UserLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) {
    return userLoaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) {
    return userLoaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) {
    return userLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) {
    return userLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(this);
    }
    return orElse();
  }
}

abstract class UserLoaded implements ApplicationState {
  const factory UserLoaded(User? user) = _$UserLoaded;

  User? get user;
  @JsonKey(ignore: true)
  $UserLoadedCopyWith<UserLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$ApplicationStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ApplicationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() appStarted,
    required TResult Function() loading,
    required TResult Function(User? user) userLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? appStarted,
    TResult Function()? loading,
    TResult Function(User? user)? userLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(Loading value) loading,
    required TResult Function(UserLoaded value) userLoaded,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(AppStarted value)? appStarted,
    TResult Function(Loading value)? loading,
    TResult Function(UserLoaded value)? userLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ApplicationState {
  const factory Error(String message) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
