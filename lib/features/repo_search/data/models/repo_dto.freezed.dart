// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepoDto _$RepoDtoFromJson(Map<String, dynamic> json) {
  return _RepoDto.fromJson(json);
}

/// @nodoc
mixin _$RepoDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  RepoOwnerDto get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stars => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forks => throw _privateConstructorUsedError;

  /// Serializes this RepoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoDtoCopyWith<RepoDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDtoCopyWith<$Res> {
  factory $RepoDtoCopyWith(RepoDto value, $Res Function(RepoDto) then) =
      _$RepoDtoCopyWithImpl<$Res, RepoDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String name,
      RepoOwnerDto owner,
      @JsonKey(name: 'stargazers_count') int stars,
      String description,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'forks_count') int forks});

  $RepoOwnerDtoCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepoDtoCopyWithImpl<$Res, $Val extends RepoDto>
    implements $RepoDtoCopyWith<$Res> {
  _$RepoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? name = null,
    Object? owner = null,
    Object? stars = null,
    Object? description = null,
    Object? htmlUrl = null,
    Object? forks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepoOwnerDto,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepoOwnerDtoCopyWith<$Res> get owner {
    return $RepoOwnerDtoCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepoDtoImplCopyWith<$Res> implements $RepoDtoCopyWith<$Res> {
  factory _$$RepoDtoImplCopyWith(
          _$RepoDtoImpl value, $Res Function(_$RepoDtoImpl) then) =
      __$$RepoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String name,
      RepoOwnerDto owner,
      @JsonKey(name: 'stargazers_count') int stars,
      String description,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'forks_count') int forks});

  @override
  $RepoOwnerDtoCopyWith<$Res> get owner;
}

/// @nodoc
class __$$RepoDtoImplCopyWithImpl<$Res>
    extends _$RepoDtoCopyWithImpl<$Res, _$RepoDtoImpl>
    implements _$$RepoDtoImplCopyWith<$Res> {
  __$$RepoDtoImplCopyWithImpl(
      _$RepoDtoImpl _value, $Res Function(_$RepoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? name = null,
    Object? owner = null,
    Object? stars = null,
    Object? description = null,
    Object? htmlUrl = null,
    Object? forks = null,
  }) {
    return _then(_$RepoDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepoOwnerDto,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoDtoImpl implements _RepoDto {
  const _$RepoDtoImpl(
      {required this.id,
      @JsonKey(name: 'full_name') required this.fullName,
      required this.name,
      required this.owner,
      @JsonKey(name: 'stargazers_count') required this.stars,
      this.description = '',
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'forks_count') required this.forks});

  factory _$RepoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String name;
  @override
  final RepoOwnerDto owner;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stars;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'forks_count')
  final int forks;

  @override
  String toString() {
    return 'RepoDto(id: $id, fullName: $fullName, name: $name, owner: $owner, stars: $stars, description: $description, htmlUrl: $htmlUrl, forks: $forks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.forks, forks) || other.forks == forks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, name, owner, stars,
      description, htmlUrl, forks);

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoDtoImplCopyWith<_$RepoDtoImpl> get copyWith =>
      __$$RepoDtoImplCopyWithImpl<_$RepoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoDtoImplToJson(
      this,
    );
  }
}

abstract class _RepoDto implements RepoDto {
  const factory _RepoDto(
      {required final int id,
      @JsonKey(name: 'full_name') required final String fullName,
      required final String name,
      required final RepoOwnerDto owner,
      @JsonKey(name: 'stargazers_count') required final int stars,
      final String description,
      @JsonKey(name: 'html_url') required final String htmlUrl,
      @JsonKey(name: 'forks_count') required final int forks}) = _$RepoDtoImpl;

  factory _RepoDto.fromJson(Map<String, dynamic> json) = _$RepoDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get name;
  @override
  RepoOwnerDto get owner;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stars;
  @override
  String get description;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'forks_count')
  int get forks;

  /// Create a copy of RepoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoDtoImplCopyWith<_$RepoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepoOwnerDto _$RepoOwnerDtoFromJson(Map<String, dynamic> json) {
  return _RepoOwnerDto.fromJson(json);
}

/// @nodoc
mixin _$RepoOwnerDto {
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this RepoOwnerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepoOwnerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoOwnerDtoCopyWith<RepoOwnerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoOwnerDtoCopyWith<$Res> {
  factory $RepoOwnerDtoCopyWith(
          RepoOwnerDto value, $Res Function(RepoOwnerDto) then) =
      _$RepoOwnerDtoCopyWithImpl<$Res, RepoOwnerDto>;
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$RepoOwnerDtoCopyWithImpl<$Res, $Val extends RepoOwnerDto>
    implements $RepoOwnerDtoCopyWith<$Res> {
  _$RepoOwnerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoOwnerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepoOwnerDtoImplCopyWith<$Res>
    implements $RepoOwnerDtoCopyWith<$Res> {
  factory _$$RepoOwnerDtoImplCopyWith(
          _$RepoOwnerDtoImpl value, $Res Function(_$RepoOwnerDtoImpl) then) =
      __$$RepoOwnerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$RepoOwnerDtoImplCopyWithImpl<$Res>
    extends _$RepoOwnerDtoCopyWithImpl<$Res, _$RepoOwnerDtoImpl>
    implements _$$RepoOwnerDtoImplCopyWith<$Res> {
  __$$RepoOwnerDtoImplCopyWithImpl(
      _$RepoOwnerDtoImpl _value, $Res Function(_$RepoOwnerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoOwnerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$RepoOwnerDtoImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoOwnerDtoImpl implements _RepoOwnerDto {
  const _$RepoOwnerDtoImpl(
      {required this.login,
      @JsonKey(name: 'avatar_url') required this.avatarUrl});

  factory _$RepoOwnerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoOwnerDtoImplFromJson(json);

  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'RepoOwnerDto(login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoOwnerDtoImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  /// Create a copy of RepoOwnerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoOwnerDtoImplCopyWith<_$RepoOwnerDtoImpl> get copyWith =>
      __$$RepoOwnerDtoImplCopyWithImpl<_$RepoOwnerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoOwnerDtoImplToJson(
      this,
    );
  }
}

abstract class _RepoOwnerDto implements RepoOwnerDto {
  const factory _RepoOwnerDto(
          {required final String login,
          @JsonKey(name: 'avatar_url') required final String avatarUrl}) =
      _$RepoOwnerDtoImpl;

  factory _RepoOwnerDto.fromJson(Map<String, dynamic> json) =
      _$RepoOwnerDtoImpl.fromJson;

  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of RepoOwnerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoOwnerDtoImplCopyWith<_$RepoOwnerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
