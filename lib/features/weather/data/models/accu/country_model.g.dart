// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Country',
      json,
      ($checkedConvert) {
        final val = Country(
          id: $checkedConvert('ID', (v) => v as String),
          localizedName: $checkedConvert('LocalizedName', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'ID', 'localizedName': 'LocalizedName'},
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'ID': instance.id,
      'LocalizedName': instance.localizedName,
    };
