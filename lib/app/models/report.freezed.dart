// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(2)
  Point? get location => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get sectorId => throw _privateConstructorUsedError;
  @HiveField(6)
  Sector? get sector => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get reportTypeId => throw _privateConstructorUsedError;
  @HiveField(8)
  ReportType? get reportType => throw _privateConstructorUsedError;
  @HiveField(9)
  int? get reportedByUserId => throw _privateConstructorUsedError;
  @HiveField(10)
  User? get reporter => throw _privateConstructorUsedError;
  @HiveField(11)
  int? get reportStatusId => throw _privateConstructorUsedError;
  @HiveField(12)
  ReportStatus? get status => throw _privateConstructorUsedError;
  @HiveField(13)
  List<Media>? get medias => throw _privateConstructorUsedError;
  @HiveField(14)
  List<ModerationHistory>? get citizenViewModerationHistory =>
      throw _privateConstructorUsedError;
  @HiveField(15)
  Area? get province => throw _privateConstructorUsedError;
  @HiveField(16)
  bool? get canComment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? description,
      @HiveField(2) Point? location,
      @HiveField(3) DateTime? createdAt,
      @HiveField(4) DateTime? updatedAt,
      @HiveField(5) int? sectorId,
      @HiveField(6) Sector? sector,
      @HiveField(7) int? reportTypeId,
      @HiveField(8) ReportType? reportType,
      @HiveField(9) int? reportedByUserId,
      @HiveField(10) User? reporter,
      @HiveField(11) int? reportStatusId,
      @HiveField(12) ReportStatus? status,
      @HiveField(13) List<Media>? medias,
      @HiveField(14) List<ModerationHistory>? citizenViewModerationHistory,
      @HiveField(15) Area? province,
      @HiveField(16) bool? canComment});

  $PointCopyWith<$Res>? get location;
  $SectorCopyWith<$Res>? get sector;
  $ReportTypeCopyWith<$Res>? get reportType;
  $UserCopyWith<$Res>? get reporter;
  $ReportStatusCopyWith<$Res>? get status;
  $AreaCopyWith<$Res>? get province;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? sectorId = freezed,
    Object? sector = freezed,
    Object? reportTypeId = freezed,
    Object? reportType = freezed,
    Object? reportedByUserId = freezed,
    Object? reporter = freezed,
    Object? reportStatusId = freezed,
    Object? status = freezed,
    Object? medias = freezed,
    Object? citizenViewModerationHistory = freezed,
    Object? province = freezed,
    Object? canComment = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sectorId: sectorId == freezed
          ? _value.sectorId
          : sectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      sector: sector == freezed
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as Sector?,
      reportTypeId: reportTypeId == freezed
          ? _value.reportTypeId
          : reportTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reportType: reportType == freezed
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      reportedByUserId: reportedByUserId == freezed
          ? _value.reportedByUserId
          : reportedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      reporter: reporter == freezed
          ? _value.reporter
          : reporter // ignore: cast_nullable_to_non_nullable
              as User?,
      reportStatusId: reportStatusId == freezed
          ? _value.reportStatusId
          : reportStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      citizenViewModerationHistory: citizenViewModerationHistory == freezed
          ? _value.citizenViewModerationHistory
          : citizenViewModerationHistory // ignore: cast_nullable_to_non_nullable
              as List<ModerationHistory>?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Area?,
      canComment: canComment == freezed
          ? _value.canComment
          : canComment // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $PointCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $SectorCopyWith<$Res>? get sector {
    if (_value.sector == null) {
      return null;
    }

    return $SectorCopyWith<$Res>(_value.sector!, (value) {
      return _then(_value.copyWith(sector: value));
    });
  }

  @override
  $ReportTypeCopyWith<$Res>? get reportType {
    if (_value.reportType == null) {
      return null;
    }

    return $ReportTypeCopyWith<$Res>(_value.reportType!, (value) {
      return _then(_value.copyWith(reportType: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get reporter {
    if (_value.reporter == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.reporter!, (value) {
      return _then(_value.copyWith(reporter: value));
    });
  }

  @override
  $ReportStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $ReportStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $AreaCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $AreaCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? description,
      @HiveField(2) Point? location,
      @HiveField(3) DateTime? createdAt,
      @HiveField(4) DateTime? updatedAt,
      @HiveField(5) int? sectorId,
      @HiveField(6) Sector? sector,
      @HiveField(7) int? reportTypeId,
      @HiveField(8) ReportType? reportType,
      @HiveField(9) int? reportedByUserId,
      @HiveField(10) User? reporter,
      @HiveField(11) int? reportStatusId,
      @HiveField(12) ReportStatus? status,
      @HiveField(13) List<Media>? medias,
      @HiveField(14) List<ModerationHistory>? citizenViewModerationHistory,
      @HiveField(15) Area? province,
      @HiveField(16) bool? canComment});

  @override
  $PointCopyWith<$Res>? get location;
  @override
  $SectorCopyWith<$Res>? get sector;
  @override
  $ReportTypeCopyWith<$Res>? get reportType;
  @override
  $UserCopyWith<$Res>? get reporter;
  @override
  $ReportStatusCopyWith<$Res>? get status;
  @override
  $AreaCopyWith<$Res>? get province;
}

/// @nodoc
class __$$_ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, (v) => _then(v as _$_Report));

  @override
  _$_Report get _value => super._value as _$_Report;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? sectorId = freezed,
    Object? sector = freezed,
    Object? reportTypeId = freezed,
    Object? reportType = freezed,
    Object? reportedByUserId = freezed,
    Object? reporter = freezed,
    Object? reportStatusId = freezed,
    Object? status = freezed,
    Object? medias = freezed,
    Object? citizenViewModerationHistory = freezed,
    Object? province = freezed,
    Object? canComment = freezed,
  }) {
    return _then(_$_Report(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sectorId: sectorId == freezed
          ? _value.sectorId
          : sectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      sector: sector == freezed
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as Sector?,
      reportTypeId: reportTypeId == freezed
          ? _value.reportTypeId
          : reportTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reportType: reportType == freezed
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      reportedByUserId: reportedByUserId == freezed
          ? _value.reportedByUserId
          : reportedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      reporter: reporter == freezed
          ? _value.reporter
          : reporter // ignore: cast_nullable_to_non_nullable
              as User?,
      reportStatusId: reportStatusId == freezed
          ? _value.reportStatusId
          : reportStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      medias: medias == freezed
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      citizenViewModerationHistory: citizenViewModerationHistory == freezed
          ? _value._citizenViewModerationHistory
          : citizenViewModerationHistory // ignore: cast_nullable_to_non_nullable
              as List<ModerationHistory>?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Area?,
      canComment: canComment == freezed
          ? _value.canComment
          : canComment // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report extends _Report {
  _$_Report(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          this.description,
      @HiveField(2)
          this.location,
      @HiveField(3)
          this.createdAt,
      @HiveField(4)
          this.updatedAt,
      @HiveField(5)
          this.sectorId,
      @HiveField(6)
          this.sector,
      @HiveField(7)
          this.reportTypeId,
      @HiveField(8)
          this.reportType,
      @HiveField(9)
          this.reportedByUserId,
      @HiveField(10)
          this.reporter,
      @HiveField(11)
          this.reportStatusId,
      @HiveField(12)
          this.status,
      @HiveField(13)
          final List<Media>? medias,
      @HiveField(14)
          final List<ModerationHistory>? citizenViewModerationHistory,
      @HiveField(15)
          this.province,
      @HiveField(16)
          this.canComment})
      : _medias = medias,
        _citizenViewModerationHistory = citizenViewModerationHistory,
        super._();

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String? description;
  @override
  @HiveField(2)
  final Point? location;
  @override
  @HiveField(3)
  final DateTime? createdAt;
  @override
  @HiveField(4)
  final DateTime? updatedAt;
  @override
  @HiveField(5)
  final int? sectorId;
  @override
  @HiveField(6)
  final Sector? sector;
  @override
  @HiveField(7)
  final int? reportTypeId;
  @override
  @HiveField(8)
  final ReportType? reportType;
  @override
  @HiveField(9)
  final int? reportedByUserId;
  @override
  @HiveField(10)
  final User? reporter;
  @override
  @HiveField(11)
  final int? reportStatusId;
  @override
  @HiveField(12)
  final ReportStatus? status;
  final List<Media>? _medias;
  @override
  @HiveField(13)
  List<Media>? get medias {
    final value = _medias;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ModerationHistory>? _citizenViewModerationHistory;
  @override
  @HiveField(14)
  List<ModerationHistory>? get citizenViewModerationHistory {
    final value = _citizenViewModerationHistory;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(15)
  final Area? province;
  @override
  @HiveField(16)
  final bool? canComment;

  @override
  String toString() {
    return 'Report(id: $id, description: $description, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, sectorId: $sectorId, sector: $sector, reportTypeId: $reportTypeId, reportType: $reportType, reportedByUserId: $reportedByUserId, reporter: $reporter, reportStatusId: $reportStatusId, status: $status, medias: $medias, citizenViewModerationHistory: $citizenViewModerationHistory, province: $province, canComment: $canComment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.sectorId, sectorId) &&
            const DeepCollectionEquality().equals(other.sector, sector) &&
            const DeepCollectionEquality()
                .equals(other.reportTypeId, reportTypeId) &&
            const DeepCollectionEquality()
                .equals(other.reportType, reportType) &&
            const DeepCollectionEquality()
                .equals(other.reportedByUserId, reportedByUserId) &&
            const DeepCollectionEquality().equals(other.reporter, reporter) &&
            const DeepCollectionEquality()
                .equals(other.reportStatusId, reportStatusId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            const DeepCollectionEquality().equals(
                other._citizenViewModerationHistory,
                _citizenViewModerationHistory) &&
            const DeepCollectionEquality().equals(other.province, province) &&
            const DeepCollectionEquality()
                .equals(other.canComment, canComment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(sectorId),
      const DeepCollectionEquality().hash(sector),
      const DeepCollectionEquality().hash(reportTypeId),
      const DeepCollectionEquality().hash(reportType),
      const DeepCollectionEquality().hash(reportedByUserId),
      const DeepCollectionEquality().hash(reporter),
      const DeepCollectionEquality().hash(reportStatusId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_medias),
      const DeepCollectionEquality().hash(_citizenViewModerationHistory),
      const DeepCollectionEquality().hash(province),
      const DeepCollectionEquality().hash(canComment));

  @JsonKey(ignore: true)
  @override
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(
      this,
    );
  }
}

abstract class _Report extends Report {
  factory _Report(
      {@HiveField(0)
          required final int id,
      @HiveField(1)
          final String? description,
      @HiveField(2)
          final Point? location,
      @HiveField(3)
          final DateTime? createdAt,
      @HiveField(4)
          final DateTime? updatedAt,
      @HiveField(5)
          final int? sectorId,
      @HiveField(6)
          final Sector? sector,
      @HiveField(7)
          final int? reportTypeId,
      @HiveField(8)
          final ReportType? reportType,
      @HiveField(9)
          final int? reportedByUserId,
      @HiveField(10)
          final User? reporter,
      @HiveField(11)
          final int? reportStatusId,
      @HiveField(12)
          final ReportStatus? status,
      @HiveField(13)
          final List<Media>? medias,
      @HiveField(14)
          final List<ModerationHistory>? citizenViewModerationHistory,
      @HiveField(15)
          final Area? province,
      @HiveField(16)
          final bool? canComment}) = _$_Report;
  _Report._() : super._();

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String? get description;
  @override
  @HiveField(2)
  Point? get location;
  @override
  @HiveField(3)
  DateTime? get createdAt;
  @override
  @HiveField(4)
  DateTime? get updatedAt;
  @override
  @HiveField(5)
  int? get sectorId;
  @override
  @HiveField(6)
  Sector? get sector;
  @override
  @HiveField(7)
  int? get reportTypeId;
  @override
  @HiveField(8)
  ReportType? get reportType;
  @override
  @HiveField(9)
  int? get reportedByUserId;
  @override
  @HiveField(10)
  User? get reporter;
  @override
  @HiveField(11)
  int? get reportStatusId;
  @override
  @HiveField(12)
  ReportStatus? get status;
  @override
  @HiveField(13)
  List<Media>? get medias;
  @override
  @HiveField(14)
  List<ModerationHistory>? get citizenViewModerationHistory;
  @override
  @HiveField(15)
  Area? get province;
  @override
  @HiveField(16)
  bool? get canComment;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
