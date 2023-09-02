// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentState {
  AmountFormz get amountFormz => throw _privateConstructorUsedError;
  PhoneNumberFormz get phoneNumberFormz => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call({AmountFormz amountFormz, PhoneNumberFormz phoneNumberFormz});
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountFormz = null,
    Object? phoneNumberFormz = null,
  }) {
    return _then(_value.copyWith(
      amountFormz: null == amountFormz
          ? _value.amountFormz
          : amountFormz // ignore: cast_nullable_to_non_nullable
              as AmountFormz,
      phoneNumberFormz: null == phoneNumberFormz
          ? _value.phoneNumberFormz
          : phoneNumberFormz // ignore: cast_nullable_to_non_nullable
              as PhoneNumberFormz,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$_PaymentStateCopyWith(
          _$_PaymentState value, $Res Function(_$_PaymentState) then) =
      __$$_PaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AmountFormz amountFormz, PhoneNumberFormz phoneNumberFormz});
}

/// @nodoc
class __$$_PaymentStateCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_PaymentState>
    implements _$$_PaymentStateCopyWith<$Res> {
  __$$_PaymentStateCopyWithImpl(
      _$_PaymentState _value, $Res Function(_$_PaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountFormz = null,
    Object? phoneNumberFormz = null,
  }) {
    return _then(_$_PaymentState(
      amountFormz: null == amountFormz
          ? _value.amountFormz
          : amountFormz // ignore: cast_nullable_to_non_nullable
              as AmountFormz,
      phoneNumberFormz: null == phoneNumberFormz
          ? _value.phoneNumberFormz
          : phoneNumberFormz // ignore: cast_nullable_to_non_nullable
              as PhoneNumberFormz,
    ));
  }
}

/// @nodoc

class _$_PaymentState with DiagnosticableTreeMixin implements _PaymentState {
  const _$_PaymentState(
      {this.amountFormz = const AmountFormz.pure(),
      this.phoneNumberFormz = const PhoneNumberFormz.pure()});

  @override
  @JsonKey()
  final AmountFormz amountFormz;
  @override
  @JsonKey()
  final PhoneNumberFormz phoneNumberFormz;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentState(amountFormz: $amountFormz, phoneNumberFormz: $phoneNumberFormz)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentState'))
      ..add(DiagnosticsProperty('amountFormz', amountFormz))
      ..add(DiagnosticsProperty('phoneNumberFormz', phoneNumberFormz));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentState &&
            (identical(other.amountFormz, amountFormz) ||
                other.amountFormz == amountFormz) &&
            (identical(other.phoneNumberFormz, phoneNumberFormz) ||
                other.phoneNumberFormz == phoneNumberFormz));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountFormz, phoneNumberFormz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      __$$_PaymentStateCopyWithImpl<_$_PaymentState>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {final AmountFormz amountFormz,
      final PhoneNumberFormz phoneNumberFormz}) = _$_PaymentState;

  @override
  AmountFormz get amountFormz;
  @override
  PhoneNumberFormz get phoneNumberFormz;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
