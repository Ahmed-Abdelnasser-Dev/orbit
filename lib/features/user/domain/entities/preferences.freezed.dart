// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Preferences {
  String get languageCode;
  AppThemePreference get theme;
  bool get notificationsAllowed;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreferencesCopyWith<Preferences> get copyWith =>
      _$PreferencesCopyWithImpl<Preferences>(this as Preferences, _$identity);

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Preferences &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.notificationsAllowed, notificationsAllowed) ||
                other.notificationsAllowed == notificationsAllowed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageCode, theme, notificationsAllowed);

  @override
  String toString() {
    return 'Preferences(languageCode: $languageCode, theme: $theme, notificationsAllowed: $notificationsAllowed)';
  }
}

/// @nodoc
abstract mixin class $PreferencesCopyWith<$Res> {
  factory $PreferencesCopyWith(
          Preferences value, $Res Function(Preferences) _then) =
      _$PreferencesCopyWithImpl;
  @useResult
  $Res call(
      {String languageCode,
      AppThemePreference theme,
      bool notificationsAllowed});
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res> implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._self, this._then);

  final Preferences _self;
  final $Res Function(Preferences) _then;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? theme = null,
    Object? notificationsAllowed = null,
  }) {
    return _then(_self.copyWith(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppThemePreference,
      notificationsAllowed: null == notificationsAllowed
          ? _self.notificationsAllowed
          : notificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Preferences].
extension PreferencesPatterns on Preferences {
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
    TResult Function(_Preferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Preferences() when $default != null:
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
    TResult Function(_Preferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Preferences():
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
    TResult? Function(_Preferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Preferences() when $default != null:
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
    TResult Function(String languageCode, AppThemePreference theme,
            bool notificationsAllowed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Preferences() when $default != null:
        return $default(
            _that.languageCode, _that.theme, _that.notificationsAllowed);
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
    TResult Function(String languageCode, AppThemePreference theme,
            bool notificationsAllowed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Preferences():
        return $default(
            _that.languageCode, _that.theme, _that.notificationsAllowed);
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
    TResult? Function(String languageCode, AppThemePreference theme,
            bool notificationsAllowed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Preferences() when $default != null:
        return $default(
            _that.languageCode, _that.theme, _that.notificationsAllowed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Preferences extends Preferences {
  const _Preferences(
      {required this.languageCode,
      required this.theme,
      required this.notificationsAllowed})
      : super._();
  factory _Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  @override
  final String languageCode;
  @override
  final AppThemePreference theme;
  @override
  final bool notificationsAllowed;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreferencesCopyWith<_Preferences> get copyWith =>
      __$PreferencesCopyWithImpl<_Preferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreferencesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Preferences &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.notificationsAllowed, notificationsAllowed) ||
                other.notificationsAllowed == notificationsAllowed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageCode, theme, notificationsAllowed);

  @override
  String toString() {
    return 'Preferences(languageCode: $languageCode, theme: $theme, notificationsAllowed: $notificationsAllowed)';
  }
}

/// @nodoc
abstract mixin class _$PreferencesCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$PreferencesCopyWith(
          _Preferences value, $Res Function(_Preferences) _then) =
      __$PreferencesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String languageCode,
      AppThemePreference theme,
      bool notificationsAllowed});
}

/// @nodoc
class __$PreferencesCopyWithImpl<$Res> implements _$PreferencesCopyWith<$Res> {
  __$PreferencesCopyWithImpl(this._self, this._then);

  final _Preferences _self;
  final $Res Function(_Preferences) _then;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? languageCode = null,
    Object? theme = null,
    Object? notificationsAllowed = null,
  }) {
    return _then(_Preferences(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppThemePreference,
      notificationsAllowed: null == notificationsAllowed
          ? _self.notificationsAllowed
          : notificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
