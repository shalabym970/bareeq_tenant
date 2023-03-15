class Project {
  Project({
    this.name,
    this.buildingNo,
    this.id,
  });

  String? name;
  dynamic buildingNo;
  String? id;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    name: json["advanced_name"],
    buildingNo: json["advanced_buildingno"],
    id: json["advanced_projectid"],
  );

  Map<String, dynamic> toJson() => {
    "advanced_name": name,
    "advanced_buildingno": buildingNo,
    "advanced_projectid": id,
  };
}