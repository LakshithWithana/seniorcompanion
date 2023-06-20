import 'dart:collection';

Map<String, dynamic> linkedHashMapToMapCoverter(dynamic linkedHashMap) {
  final LinkedHashMap<dynamic, dynamic> theParsedOne =
      linkedHashMap as LinkedHashMap;
  final HashMap<String, dynamic> newMap =
      HashMap.from(theParsedOne.map((key, value) {
    return MapEntry(key.toString(), value);
  }));
//todo use this
  return newMap;
}
