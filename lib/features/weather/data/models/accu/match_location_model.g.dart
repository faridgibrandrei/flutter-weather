// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchLocationModel _$MatchLocationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MatchLocationModel',
      json,
      ($checkedConvert) {
        final val = MatchLocationModel(
          key: $checkedConvert('Key', (v) => v as String),
          localizedName: $checkedConvert('LocalizedName', (v) => v as String),
          country: $checkedConvert(
              'Country', (v) => Country.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'key': 'Key',
        'localizedName': 'LocalizedName',
        'country': 'Country'
      },
    );

Map<String, dynamic> _$MatchLocationModelToJson(MatchLocationModel instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'LocalizedName': instance.localizedName,
      'Country': instance.country.toJson(),
    };
