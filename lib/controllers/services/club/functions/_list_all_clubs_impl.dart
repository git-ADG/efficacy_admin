part of '../club_controller.dart';

Stream<List<ClubModel>> _listAllClubsImpl({
  List<String> instituteName = const [],
  bool minified = true,
}) async* {
  List<ClubModel> filteredClubs = [];

  filteredClubs = await _fetchAllClubsLocal(
    instituteName: instituteName,
    minified: minified,
  );
  if (filteredClubs.isNotEmpty) yield filteredClubs;

  filteredClubs = await _fetchAllClubsFromBacked(
    instituteName: instituteName,
    minified: minified,
  );
  yield filteredClubs;
}

Future<List<ClubModel>> _fetchAllClubsLocal({
  List<String> instituteName = const [],
  bool minified = true,
}) async {
  List<ClubModel> filteredClubs = [];
  Map? res =
      await LocalDatabase.get(LocalCollections.club, LocalDocuments.clubs);
  if (res != null) {
    res = Formatter.convertMapToMapStringDynamic(res)!;
    if (minified == true) {
      for (dynamic model in res.values) {
        ClubModel clubModel = ClubModel.minifiedFromJson(model);
        if (instituteName.isEmpty ||
            instituteName.contains(clubModel.instituteName)) {
          filteredClubs.add(clubModel);
        }
      }
    } else {
      for (dynamic model in res.values) {
        if (!ClubController._isMinified(model)) {
          ClubModel clubModel = ClubModel.minifiedFromJson(model);
          if (instituteName.isEmpty ||
              instituteName.contains(clubModel.instituteName)) {
            filteredClubs.add(clubModel);
          }
        }
      }
    }
  }
  return filteredClubs;
}

Future<List<ClubModel>> _fetchAllClubsFromBacked({
  List<String> instituteName = const [],
  bool minified = true,
}) async {
  List<ClubModel> filteredClubs = [];

  DbCollection collection =
      Database.instance.collection(ClubController._collectionName);
  SelectorBuilder selectorBuilder = SelectorBuilder();
  if (minified) {
    selectorBuilder.fields([
      "_id",
      ClubFields.name.name,
      ClubFields.instituteName.name,
    ]);
  }

  if (instituteName.isNotEmpty) {
    selectorBuilder.all(ClubFields.instituteName.name, instituteName);
  }

  List<Map<String, dynamic>> listResponse =
      await collection.find(selectorBuilder).toList();
  filteredClubs = [];
  for (Map<String, dynamic> val in listResponse) {
    ClubModel clubModel = ClubModel.minifiedFromJson(val);
    clubModel = await ClubController._save(clubModel);
    filteredClubs.add(clubModel);
  }
  return filteredClubs;
}
