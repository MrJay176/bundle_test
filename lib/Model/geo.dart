/// lat : "-37.3159"
/// lng : "81.1496"

class Geo {
  String _lat;
  String _lng;

  String get lat => _lat;
  String get lng => _lng;

  Geo({
      String lat, 
      String lng}){
    _lat = lat;
    _lng = lng;
}

  Geo.fromJson(dynamic json) {
    _lat = json["lat"];
    _lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = _lat;
    map["lng"] = _lng;
    return map;
  }

}