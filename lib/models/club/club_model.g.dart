// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClubModel _$$_ClubModelFromJson(Map<String, dynamic> json) => _$_ClubModel(
      id: const ObjectIdSerializer().fromJson(json['_id']),
      name: json['name'] as String,
      instituteName: json['instituteName'] as String,
      description: json['description'] as String,
      socials: (json['socials'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$SocialEnumMap, k), e as String),
          ) ??
          const {},
      email: json['email'] as String,
      phoneNumber: const PhoneNumberSerializer()
          .fromJson(json['phoneNumber'] as Map<String, String?>?),
      clubLogoURL: json['clubLogoURL'] as String,
      clubBannerURL: json['clubBannerURL'] as String?,
      members: json['members'],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$_ClubModelToJson(_$_ClubModel instance) =>
    <String, dynamic>{
      '_id': const ObjectIdSerializer().toJson(instance.id),
      'name': instance.name,
      'instituteName': instance.instituteName,
      'description': instance.description,
      'socials':
          instance.socials.map((k, e) => MapEntry(_$SocialEnumMap[k]!, e)),
      'email': instance.email,
      'phoneNumber': const PhoneNumberSerializer().toJson(instance.phoneNumber),
      'clubLogoURL': instance.clubLogoURL,
      'clubBannerURL': instance.clubBannerURL,
      'members': instance.members,
      'followers': instance.followers,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };

const _$SocialEnumMap = {
  Social.github: 'github',
  Social.facebook: 'facebook',
  Social.instagram: 'instagram',
  Social.linkedin: 'linkedin',
};
