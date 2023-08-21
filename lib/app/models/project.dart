import 'package:Bareeq/app/models/unit.dart';

class Project {
  int? type;
  String? transactionCurrencyId;
  String? country;
  int? numberOfUnits;
  String? locationDescription;
  String? location;
  int? projectStatus;
  String? city;
  int? status;
  DateTime? createdOn;
  String? englishTitle;
  String? name;
  String? fitOutProcessId;
  String? arabicTitle;
  Unit? unit;
  String? description;
  String? governmentId;
  String? id;

  Project({
    this.type,
    this.transactionCurrencyId,
    this.country,
    this.numberOfUnits,
    this.locationDescription,
    this.location,
    this.projectStatus,
    this.city,
    this.status,
    this.createdOn,
    this.englishTitle,
    this.name,
    this.fitOutProcessId,
    this.arabicTitle,
    this.unit,
    this.description,
    this.governmentId,
    this.id,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        type: json["new_contracttypes"],
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        country: json["_blser_country_value"],
        numberOfUnits: json["blser_numberofunits"],
        locationDescription: json["bls_locationdescription"],
        location: json["advanced_location"],
        projectStatus: json["bls_projectstatus"],
        city: json["_blser_city_value"],
        status: json["statuscode"],
        createdOn: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        englishTitle: json["blser_englishtitle"],
        name: json["advanced_name"],
        fitOutProcessId: json["blser_fitoutprocessguide"],
        arabicTitle: json["blser_arabictitle"],
        unit: json["advanced_unit"],
        description: json["advanced_description"],
        governmentId: json["new_governmentid"],
        id: json["advanced_projectid"],
      );
}
