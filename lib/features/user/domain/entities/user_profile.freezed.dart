// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {
  int get age;
  double get weightKg;
  double get heightCm;
  TimeOfDayWakeSleep get wakeSleep;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.wakeSleep, wakeSleep) ||
                other.wakeSleep == wakeSleep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, age, weightKg, heightCm, wakeSleep);

  @override
  String toString() {
    return 'UserProfile(age: $age, weightKg: $weightKg, heightCm: $heightCm, wakeSleep: $wakeSleep)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) _then) =
      _$UserProfileCopyWithImpl;
  @useResult
  $Res call(
      {int age,
      double weightKg,
      double heightCm,
      TimeOfDayWakeSleep wakeSleep});

  $TimeOfDayWakeSleepCopyWith<$Res> get wakeSleep;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? wakeSleep = null,
  }) {
    return _then(_self.copyWith(
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      heightCm: null == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double,
      wakeSleep: null == wakeSleep
          ? _self.wakeSleep
          : wakeSleep // ignore: cast_nullable_to_non_nullable
              as TimeOfDayWakeSleep,
    ));
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayWakeSleepCopyWith<$Res> get wakeSleep {
    return $TimeOfDayWakeSleepCopyWith<$Res>(_self.wakeSleep, (value) {
      return _then(_self.copyWith(wakeSleep: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int age, double weightKg, double heightCm,
            TimeOfDayWakeSleep wakeSleep)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfile() when $default != null:
        return $default(
            _that.age, _that.weightKg, _that.heightCm, _that.wakeSleep);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int age, double weightKg, double heightCm,
            TimeOfDayWakeSleep wakeSleep)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfile():
        return $default(
            _that.age, _that.weightKg, _that.heightCm, _that.wakeSleep);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int age, double weightKg, double heightCm,
            TimeOfDayWakeSleep wakeSleep)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfile() when $default != null:
        return $default(
            _that.age, _that.weightKg, _that.heightCm, _that.wakeSleep);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfile extends UserProfile {
  const _UserProfile(
      {required this.age,
      required this.weightKg,
      required this.heightCm,
      required this.wakeSleep})
      : super._();
  factory _UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @override
  final int age;
  @override
  final double weightKg;
  @override
  final double heightCm;
  @override
  final TimeOfDayWakeSleep wakeSleep;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.wakeSleep, wakeSleep) ||
                other.wakeSleep == wakeSleep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, age, weightKg, heightCm, wakeSleep);

  @override
  String toString() {
    return 'UserProfile(age: $age, weightKg: $weightKg, heightCm: $heightCm, wakeSleep: $wakeSleep)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) _then) =
      __$UserProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int age,
      double weightKg,
      double heightCm,
      TimeOfDayWakeSleep wakeSleep});

  @override
  $TimeOfDayWakeSleepCopyWith<$Res> get wakeSleep;
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? age = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? wakeSleep = null,
  }) {
    return _then(_UserProfile(
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      heightCm: null == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double,
      wakeSleep: null == wakeSleep
          ? _self.wakeSleep
          : wakeSleep // ignore: cast_nullable_to_non_nullable
              as TimeOfDayWakeSleep,
    ));
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayWakeSleepCopyWith<$Res> get wakeSleep {
    return $TimeOfDayWakeSleepCopyWith<$Res>(_self.wakeSleep, (value) {
      return _then(_self.copyWith(wakeSleep: value));
    });
  }
}

/// @nodoc
mixin _$TimeOfDayWakeSleep {
  String get wakeUp; // HH:mm 24h
  String get sleep;

  /// Create a copy of TimeOfDayWakeSleep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeOfDayWakeSleepCopyWith<TimeOfDayWakeSleep> get copyWith =>
      _$TimeOfDayWakeSleepCopyWithImpl<TimeOfDayWakeSleep>(
          this as TimeOfDayWakeSleep, _$identity);

  /// Serializes this TimeOfDayWakeSleep to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeOfDayWakeSleep &&
            (identical(other.wakeUp, wakeUp) || other.wakeUp == wakeUp) &&
            (identical(other.sleep, sleep) || other.sleep == sleep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wakeUp, sleep);

  @override
  String toString() {
    return 'TimeOfDayWakeSleep(wakeUp: $wakeUp, sleep: $sleep)';
  }
}

/// @nodoc
abstract mixin class $TimeOfDayWakeSleepCopyWith<$Res> {
  factory $TimeOfDayWakeSleepCopyWith(
          TimeOfDayWakeSleep value, $Res Function(TimeOfDayWakeSleep) _then) =
      _$TimeOfDayWakeSleepCopyWithImpl;
  @useResult
  $Res call({String wakeUp, String sleep});
}

/// @nodoc
class _$TimeOfDayWakeSleepCopyWithImpl<$Res>
    implements $TimeOfDayWakeSleepCopyWith<$Res> {
  _$TimeOfDayWakeSleepCopyWithImpl(this._self, this._then);

  final TimeOfDayWakeSleep _self;
  final $Res Function(TimeOfDayWakeSleep) _then;

  /// Create a copy of TimeOfDayWakeSleep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeUp = null,
    Object? sleep = null,
  }) {
    return _then(_self.copyWith(
      wakeUp: null == wakeUp
          ? _self.wakeUp
          : wakeUp // ignore: cast_nullable_to_non_nullable
              as String,
      sleep: null == sleep
          ? _self.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TimeOfDayWakeSleep].
extension TimeOfDayWakeSleepPatterns on TimeOfDayWakeSleep {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TimeOfDayWakeSleep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TimeOfDayWakeSleep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TimeOfDayWakeSleep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String wakeUp, String sleep)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep() when $default != null:
        return $default(_that.wakeUp, _that.sleep);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String wakeUp, String sleep) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep():
        return $default(_that.wakeUp, _that.sleep);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String wakeUp, String sleep)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeOfDayWakeSleep() when $default != null:
        return $default(_that.wakeUp, _that.sleep);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TimeOfDayWakeSleep extends TimeOfDayWakeSleep {
  const _TimeOfDayWakeSleep({required this.wakeUp, required this.sleep})
      : super._();
  factory _TimeOfDayWakeSleep.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayWakeSleepFromJson(json);

  @override
  final String wakeUp;
// HH:mm 24h
  @override
  final String sleep;

  /// Create a copy of TimeOfDayWakeSleep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeOfDayWakeSleepCopyWith<_TimeOfDayWakeSleep> get copyWith =>
      __$TimeOfDayWakeSleepCopyWithImpl<_TimeOfDayWakeSleep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimeOfDayWakeSleepToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeOfDayWakeSleep &&
            (identical(other.wakeUp, wakeUp) || other.wakeUp == wakeUp) &&
            (identical(other.sleep, sleep) || other.sleep == sleep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wakeUp, sleep);

  @override
  String toString() {
    return 'TimeOfDayWakeSleep(wakeUp: $wakeUp, sleep: $sleep)';
  }
}

/// @nodoc
abstract mixin class _$TimeOfDayWakeSleepCopyWith<$Res>
    implements $TimeOfDayWakeSleepCopyWith<$Res> {
  factory _$TimeOfDayWakeSleepCopyWith(
          _TimeOfDayWakeSleep value, $Res Function(_TimeOfDayWakeSleep) _then) =
      __$TimeOfDayWakeSleepCopyWithImpl;
  @override
  @useResult
  $Res call({String wakeUp, String sleep});
}

/// @nodoc
class __$TimeOfDayWakeSleepCopyWithImpl<$Res>
    implements _$TimeOfDayWakeSleepCopyWith<$Res> {
  __$TimeOfDayWakeSleepCopyWithImpl(this._self, this._then);

  final _TimeOfDayWakeSleep _self;
  final $Res Function(_TimeOfDayWakeSleep) _then;

  /// Create a copy of TimeOfDayWakeSleep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? wakeUp = null,
    Object? sleep = null,
  }) {
    return _then(_TimeOfDayWakeSleep(
      wakeUp: null == wakeUp
          ? _self.wakeUp
          : wakeUp // ignore: cast_nullable_to_non_nullable
              as String,
      sleep: null == sleep
          ? _self.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
