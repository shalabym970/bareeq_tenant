import 'package:Seef/app/models/project.dart';
import 'package:Seef/app/models/unit.dart';

import 'brand.dart';

class LeaseModel {
  String? id;
  DateTime? endDate;
  DateTime? terminationDate;
  DateTime? contractDate;
  int? contractPeriod;
  DateTime? startDate;
  DateTime? commencementDate;
  int? type;
  String? name;
  String? brandName;
  int? erpLeaseNumber;
  String? crmLeaseNumber;
  Unit? unit;
  Brand? brand;
  Project? property;
  int? status;
  double? amount;

  LeaseModel(
      {this.id,
      this.endDate,
      this.terminationDate,
      this.contractDate,
      this.contractPeriod,
      this.startDate,
      this.commencementDate,
      this.type,
      this.name,
      this.brandName,
      this.erpLeaseNumber,
      this.crmLeaseNumber,
      this.unit,
      this.brand,
      this.property,
      this.status,
      this.amount});

  factory LeaseModel.fromJson(Map<String, dynamic> json) => LeaseModel(
        id: json["advanced_propertycontractid"],
        amount: json["advanced_rentamount"],
        endDate: json["advanced_enddate"] == null
            ? null
            : DateTime.parse(json["advanced_enddate"]),
        terminationDate: json["advanced_terminationdate"],
        contractDate: json["advanced_contractdate"] == null
            ? null
            : DateTime.parse(json["advanced_contractdate"]),
        contractPeriod: json["advanced_contractperiod"],
        startDate: json["advanced_startdate"] == null
            ? null
            : DateTime.parse(json["advanced_startdate"]),
        commencementDate: json["new_commencementdate"] == null
            ? null
            : DateTime.parse(json["new_commencementdate"]),
        type: json["advanced_contracttype"],
        name: json["advanced_name"],
        brandName: json["blser_brandname"],
        erpLeaseNumber: json["new_erpcontractnumber"],
        status: json["advanced_contractstatus"],
        crmLeaseNumber: json["blser_leasenumber"],
        unit: json["advanced_unitid"] == null
            ? null
            : Unit.fromJson(json["advanced_unitid"]),
        brand: json["blser_BrandShop"] == null
            ? null
            : Brand.fromJson(json["blser_BrandShop"]),
        property: json["blser_Property"] == null
            ? null
            : Project.fromJson(json["blser_Property"]),
      );
}