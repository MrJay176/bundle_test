/// name : "Romaguera-Crona"
/// catchPhrase : "Multi-layered client-server neural-net"
/// bs : "harness real-time e-markets"

class Company {
  String _name;
  String _catchPhrase;
  String _bs;

  String get name => _name;
  String get catchPhrase => _catchPhrase;
  String get bs => _bs;

  Company({
      String name, 
      String catchPhrase, 
      String bs}){
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
}

  Company.fromJson(dynamic json) {
    _name = json["name"];
    _catchPhrase = json["catchPhrase"];
    _bs = json["bs"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["catchPhrase"] = _catchPhrase;
    map["bs"] = _bs;
    return map;
  }

}