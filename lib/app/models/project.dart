class Project {
  dynamic newContracttypes;
  String? transactioncurrencyidValue;
  String? blserCountryValue;
  int? blserNumberofunits;
  String? blsLocationdescription;
  String? advancedLocation;
  int? blsProjectstatus;
  String? blserCityValue;
  int? statuscode;
  DateTime? createdon;
  String? blserEnglishtitle;
  String? name;
  dynamic blserFitoutprocessguide;
  String? blserArabictitle;
  dynamic advancedUnit;
  String? advancedDescription;
  String? newGovernmentid;
  String? advancedProjectid;

  Project({
    this.newContracttypes,
    this.transactioncurrencyidValue,
    this.blserCountryValue,
    this.blserNumberofunits,
    this.blsLocationdescription,
    this.advancedLocation,
    this.blsProjectstatus,
    this.blserCityValue,
    this.statuscode,
    this.createdon,
    this.blserEnglishtitle,
    this.name,
    this.blserFitoutprocessguide,
    this.blserArabictitle,
    this.advancedUnit,
    this.advancedDescription,
    this.newGovernmentid,
    this.advancedProjectid,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      Project(
        newContracttypes: json["new_contracttypes"],
        transactioncurrencyidValue: json["_transactioncurrencyid_value"],
        blserCountryValue: json["_blser_country_value"],
        blserNumberofunits: json["blser_numberofunits"],
        blsLocationdescription: json["bls_locationdescription"],
        advancedLocation: json["advanced_location"],
        blsProjectstatus: json["bls_projectstatus"],
        blserCityValue: json["_blser_city_value"],
        statuscode: json["statuscode"],
        createdon: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        blserEnglishtitle: json["blser_englishtitle"],
        name: json["advanced_name"],
        blserFitoutprocessguide: json["blser_fitoutprocessguide"],
        blserArabictitle: json["blser_arabictitle"],
        advancedUnit: json["advanced_unit"],
        advancedDescription: json["advanced_description"],
        newGovernmentid: json["new_governmentid"],
        advancedProjectid: json["advanced_projectid"],
      );

  Map<String, dynamic> toJson() => {
    "new_contracttypes": newContracttypes,
    "_transactioncurrencyid_value": transactioncurrencyidValue,
    "_blser_country_value": blserCountryValue,
    "blser_numberofunits": blserNumberofunits,
    "bls_locationdescription": blsLocationdescription,
    "advanced_location": advancedLocation,
    "bls_projectstatus": blsProjectstatus,
    "_blser_city_value": blserCityValue,
    "statuscode": statuscode,
    "createdon": createdon?.toIso8601String(),
    "blser_englishtitle": blserEnglishtitle,
    "advanced_name": name,
    "blser_fitoutprocessguide": blserFitoutprocessguide,
    "blser_arabictitle": blserArabictitle,
    "advanced_unit": advancedUnit,
    "advanced_description": advancedDescription,
    "new_governmentid": newGovernmentid,
    "advanced_projectid": advancedProjectid,
  };
}