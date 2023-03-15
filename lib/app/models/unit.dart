class Unit {
  Unit({
    this.name,
    this.relatedContract,
    this.state,
    this.id,
  });

  String? name;
  String? relatedContract;
  int? state;
  String? id;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    name: json["advanced_name"],
    relatedContract: json["_bls_relatedleasecontract_value"],
    state: json["statecode"],
    id: json["advanced_unitid"],
  );

  Map<String, dynamic> toJson() => {
    "advanced_name": name,
    "_bls_relatedleasecontract_value": relatedContract,
    "statecode": state,
    "advanced_unitid": id,
  };
}
