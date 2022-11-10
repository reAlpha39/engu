// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'courses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Courses _$CoursesFromJson(Map<String, dynamic> json) {
  return _Courses.fromJson(json);
}

/// @nodoc
mixin _$Courses {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_speech')
  String get testSpeech => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoursesCopyWith<Courses> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursesCopyWith<$Res> {
  factory $CoursesCopyWith(Courses value, $Res Function(Courses) then) =
      _$CoursesCopyWithImpl<$Res, Courses>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: 'test_speech') String testSpeech});
}

/// @nodoc
class _$CoursesCopyWithImpl<$Res, $Val extends Courses>
    implements $CoursesCopyWith<$Res> {
  _$CoursesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = null,
    Object? testSpeech = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      testSpeech: null == testSpeech
          ? _value.testSpeech
          : testSpeech // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoursesCopyWith<$Res> implements $CoursesCopyWith<$Res> {
  factory _$$_CoursesCopyWith(
          _$_Courses value, $Res Function(_$_Courses) then) =
      __$$_CoursesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: 'test_speech') String testSpeech});
}

/// @nodoc
class __$$_CoursesCopyWithImpl<$Res>
    extends _$CoursesCopyWithImpl<$Res, _$_Courses>
    implements _$$_CoursesCopyWith<$Res> {
  __$$_CoursesCopyWithImpl(_$_Courses _value, $Res Function(_$_Courses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = null,
    Object? testSpeech = null,
  }) {
    return _then(_$_Courses(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      testSpeech: null == testSpeech
          ? _value.testSpeech
          : testSpeech // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Courses implements _Courses {
  _$_Courses(
      {this.id = 0,
      this.name = "",
      this.description = "",
      this.url = "",
      @JsonKey(name: 'test_speech') this.testSpeech = ""});

  factory _$_Courses.fromJson(Map<String, dynamic> json) =>
      _$$_CoursesFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: 'test_speech')
  final String testSpeech;

  @override
  String toString() {
    return 'Courses(id: $id, name: $name, description: $description, url: $url, testSpeech: $testSpeech)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Courses &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.testSpeech, testSpeech) ||
                other.testSpeech == testSpeech));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, url, testSpeech);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoursesCopyWith<_$_Courses> get copyWith =>
      __$$_CoursesCopyWithImpl<_$_Courses>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoursesToJson(
      this,
    );
  }
}

abstract class _Courses implements Courses {
  factory _Courses(
      {final int id,
      final String name,
      final String description,
      final String url,
      @JsonKey(name: 'test_speech') final String testSpeech}) = _$_Courses;

  factory _Courses.fromJson(Map<String, dynamic> json) = _$_Courses.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get url;
  @override
  @JsonKey(name: 'test_speech')
  String get testSpeech;
  @override
  @JsonKey(ignore: true)
  _$$_CoursesCopyWith<_$_Courses> get copyWith =>
      throw _privateConstructorUsedError;
}
