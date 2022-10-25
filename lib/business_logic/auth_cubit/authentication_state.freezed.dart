// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res> extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, (v) => _then(v as _$Idle));

  @override
  _$Idle get _value => super._value as _$Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'AuthenticationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AuthenticationState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthenticationState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ObscureTextChangeStateCopyWith<$Res> {
  factory _$$ObscureTextChangeStateCopyWith(_$ObscureTextChangeState value,
          $Res Function(_$ObscureTextChangeState) then) =
      __$$ObscureTextChangeStateCopyWithImpl<$Res>;
  $Res call({IconData x});
}

/// @nodoc
class __$$ObscureTextChangeStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$ObscureTextChangeStateCopyWith<$Res> {
  __$$ObscureTextChangeStateCopyWithImpl(_$ObscureTextChangeState _value,
      $Res Function(_$ObscureTextChangeState) _then)
      : super(_value, (v) => _then(v as _$ObscureTextChangeState));

  @override
  _$ObscureTextChangeState get _value =>
      super._value as _$ObscureTextChangeState;

  @override
  $Res call({
    Object? x = freezed,
  }) {
    return _then(_$ObscureTextChangeState(
      x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$ObscureTextChangeState implements ObscureTextChangeState {
  const _$ObscureTextChangeState(this.x);

  @override
  final IconData x;

  @override
  String toString() {
    return 'AuthenticationState.obscureTextChangeState(x: $x)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObscureTextChangeState &&
            const DeepCollectionEquality().equals(other.x, x));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(x));

  @JsonKey(ignore: true)
  @override
  _$$ObscureTextChangeStateCopyWith<_$ObscureTextChangeState> get copyWith =>
      __$$ObscureTextChangeStateCopyWithImpl<_$ObscureTextChangeState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return obscureTextChangeState(x);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return obscureTextChangeState?.call(x);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (obscureTextChangeState != null) {
      return obscureTextChangeState(x);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return obscureTextChangeState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return obscureTextChangeState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (obscureTextChangeState != null) {
      return obscureTextChangeState(this);
    }
    return orElse();
  }
}

abstract class ObscureTextChangeState implements AuthenticationState {
  const factory ObscureTextChangeState(final IconData x) =
      _$ObscureTextChangeState;

  IconData get x;
  @JsonKey(ignore: true)
  _$$ObscureTextChangeStateCopyWith<_$ObscureTextChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
  $Res call({dynamic data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, (v) => _then(v as _$Success));

  @override
  _$Success get _value => super._value as _$Success;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success(
      data == freezed ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success(this.data);

  @override
  final dynamic data;

  @override
  String toString() {
    return 'AuthenticationState.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<_$Success> get copyWith =>
      __$$SuccessCopyWithImpl<_$Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AuthenticationState {
  const factory Success(final dynamic data) = _$Success;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessLoginCopyWith<$Res> {
  factory _$$SuccessLoginCopyWith(
          _$SuccessLogin value, $Res Function(_$SuccessLogin) then) =
      __$$SuccessLoginCopyWithImpl<$Res>;
  $Res call({LoginModel data});
}

/// @nodoc
class __$$SuccessLoginCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$SuccessLoginCopyWith<$Res> {
  __$$SuccessLoginCopyWithImpl(
      _$SuccessLogin _value, $Res Function(_$SuccessLogin) _then)
      : super(_value, (v) => _then(v as _$SuccessLogin));

  @override
  _$SuccessLogin get _value => super._value as _$SuccessLogin;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessLogin(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginModel,
    ));
  }
}

/// @nodoc

class _$SuccessLogin implements SuccessLogin {
  const _$SuccessLogin(this.data);

  @override
  final LoginModel data;

  @override
  String toString() {
    return 'AuthenticationState.successLogin(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessLogin &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessLoginCopyWith<_$SuccessLogin> get copyWith =>
      __$$SuccessLoginCopyWithImpl<_$SuccessLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return successLogin(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return successLogin?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return successLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return successLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin(this);
    }
    return orElse();
  }
}

abstract class SuccessLogin implements AuthenticationState {
  const factory SuccessLogin(final LoginModel data) = _$SuccessLogin;

  LoginModel get data;
  @JsonKey(ignore: true)
  _$$SuccessLoginCopyWith<_$SuccessLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({NetworkExceptions networkExceptions});

  $NetworkExceptionsCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? networkExceptions = freezed,
  }) {
    return _then(_$Error(
      networkExceptions == freezed
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  $NetworkExceptionsCopyWith<$Res> get networkExceptions {
    return $NetworkExceptionsCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'AuthenticationState.error(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality()
                .equals(other.networkExceptions, networkExceptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(networkExceptions));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(IconData x) obscureTextChangeState,
    required TResult Function(dynamic data) success,
    required TResult Function(LoginModel data) successLogin,
    required TResult Function(NetworkExceptions networkExceptions) error,
  }) {
    return error(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
  }) {
    return error?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(IconData x)? obscureTextChangeState,
    TResult Function(dynamic data)? success,
    TResult Function(LoginModel data)? successLogin,
    TResult Function(NetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ObscureTextChangeState value)
        obscureTextChangeState,
    required TResult Function(Success value) success,
    required TResult Function(SuccessLogin value) successLogin,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ObscureTextChangeState value)? obscureTextChangeState,
    TResult Function(Success value)? success,
    TResult Function(SuccessLogin value)? successLogin,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthenticationState {
  const factory Error(final NetworkExceptions networkExceptions) = _$Error;

  NetworkExceptions get networkExceptions;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
