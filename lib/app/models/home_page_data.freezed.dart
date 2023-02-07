// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) {
  return _HomePageData.fromJson(json);
}

/// @nodoc
mixin _$HomePageData {
  @HiveField(0)
  List<Institution> get municipalities => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Institution> get serviceProviders => throw _privateConstructorUsedError;
  @HiveField(2)
  List<Sector> get sectors => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Faq> get faqs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageDataCopyWith<HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageDataCopyWith<$Res> {
  factory $HomePageDataCopyWith(
          HomePageData value, $Res Function(HomePageData) then) =
      _$HomePageDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<Institution> municipalities,
      @HiveField(1) List<Institution> serviceProviders,
      @HiveField(2) List<Sector> sectors,
      @HiveField(3) List<Faq> faqs});
}

/// @nodoc
class _$HomePageDataCopyWithImpl<$Res> implements $HomePageDataCopyWith<$Res> {
  _$HomePageDataCopyWithImpl(this._value, this._then);

  final HomePageData _value;
  // ignore: unused_field
  final $Res Function(HomePageData) _then;

  @override
  $Res call({
    Object? municipalities = freezed,
    Object? serviceProviders = freezed,
    Object? sectors = freezed,
    Object? faqs = freezed,
  }) {
    return _then(_value.copyWith(
      municipalities: municipalities == freezed
          ? _value.municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      serviceProviders: serviceProviders == freezed
          ? _value.serviceProviders
          : serviceProviders // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>,
      faqs: faqs == freezed
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faq>,
    ));
  }
}

/// @nodoc
abstract class _$$_HomePageDataCopyWith<$Res>
    implements $HomePageDataCopyWith<$Res> {
  factory _$$_HomePageDataCopyWith(
          _$_HomePageData value, $Res Function(_$_HomePageData) then) =
      __$$_HomePageDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<Institution> municipalities,
      @HiveField(1) List<Institution> serviceProviders,
      @HiveField(2) List<Sector> sectors,
      @HiveField(3) List<Faq> faqs});
}

/// @nodoc
class __$$_HomePageDataCopyWithImpl<$Res>
    extends _$HomePageDataCopyWithImpl<$Res>
    implements _$$_HomePageDataCopyWith<$Res> {
  __$$_HomePageDataCopyWithImpl(
      _$_HomePageData _value, $Res Function(_$_HomePageData) _then)
      : super(_value, (v) => _then(v as _$_HomePageData));

  @override
  _$_HomePageData get _value => super._value as _$_HomePageData;

  @override
  $Res call({
    Object? municipalities = freezed,
    Object? serviceProviders = freezed,
    Object? sectors = freezed,
    Object? faqs = freezed,
  }) {
    return _then(_$_HomePageData(
      municipalities: municipalities == freezed
          ? _value._municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      serviceProviders: serviceProviders == freezed
          ? _value._serviceProviders
          : serviceProviders // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      sectors: sectors == freezed
          ? _value._sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>,
      faqs: faqs == freezed
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomePageData extends _HomePageData {
  _$_HomePageData(
      {@HiveField(0) required final List<Institution> municipalities,
      @HiveField(1) required final List<Institution> serviceProviders,
      @HiveField(2) required final List<Sector> sectors,
      @HiveField(3) required final List<Faq> faqs})
      : _municipalities = municipalities,
        _serviceProviders = serviceProviders,
        _sectors = sectors,
        _faqs = faqs,
        super._();

  factory _$_HomePageData.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageDataFromJson(json);

  final List<Institution> _municipalities;
  @override
  @HiveField(0)
  List<Institution> get municipalities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_municipalities);
  }

  final List<Institution> _serviceProviders;
  @override
  @HiveField(1)
  List<Institution> get serviceProviders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceProviders);
  }

  final List<Sector> _sectors;
  @override
  @HiveField(2)
  List<Sector> get sectors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sectors);
  }

  final List<Faq> _faqs;
  @override
  @HiveField(3)
  List<Faq> get faqs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqs);
  }

  @override
  String toString() {
    return 'HomePageData(municipalities: $municipalities, serviceProviders: $serviceProviders, sectors: $sectors, faqs: $faqs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageData &&
            const DeepCollectionEquality()
                .equals(other._municipalities, _municipalities) &&
            const DeepCollectionEquality()
                .equals(other._serviceProviders, _serviceProviders) &&
            const DeepCollectionEquality().equals(other._sectors, _sectors) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_municipalities),
      const DeepCollectionEquality().hash(_serviceProviders),
      const DeepCollectionEquality().hash(_sectors),
      const DeepCollectionEquality().hash(_faqs));

  @JsonKey(ignore: true)
  @override
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      __$$_HomePageDataCopyWithImpl<_$_HomePageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageDataToJson(
      this,
    );
  }
}

abstract class _HomePageData extends HomePageData {
  factory _HomePageData(
      {@HiveField(0) required final List<Institution> municipalities,
      @HiveField(1) required final List<Institution> serviceProviders,
      @HiveField(2) required final List<Sector> sectors,
      @HiveField(3) required final List<Faq> faqs}) = _$_HomePageData;
  _HomePageData._() : super._();

  factory _HomePageData.fromJson(Map<String, dynamic> json) =
      _$_HomePageData.fromJson;

  @override
  @HiveField(0)
  List<Institution> get municipalities;
  @override
  @HiveField(1)
  List<Institution> get serviceProviders;
  @override
  @HiveField(2)
  List<Sector> get sectors;
  @override
  @HiveField(3)
  List<Faq> get faqs;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
