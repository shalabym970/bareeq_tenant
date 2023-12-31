import 'package:bareeq/app/models/project.dart';
import 'package:bareeq/app/models/unit.dart';

import 'brand.dart';

class LeasedProperty {
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

  LeasedProperty(
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

  factory LeasedProperty.fromJson(Map<String, dynamic> json) => LeasedProperty(
        id: json["advanced_propertycontractid"],
        amount: json["advanced_rentamount"],
        endDate: json["advanced_enddate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["advanced_enddate"]),
        terminationDate: json["advanced_terminationdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["advanced_terminationdate"]),
        contractDate: json["advanced_contractdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["advanced_contractdate"]),
        contractPeriod: json["advanced_contractperiod"],
        startDate: json["advanced_startdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["advanced_startdate"]),
        commencementDate: json["new_commencementdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["new_commencementdate"]),
        type: json["advanced_contracttype"],
        name: json["advanced_name"],
        brandName: json["blser_brandname"],
        erpLeaseNumber: json["new_erpcontractnumber"],
        status: json["advanced_contractstatus"],
        crmLeaseNumber: json["blser_leasenumber"],
        unit: json["advanced_unitid"] != null
            ? Unit.fromJson(json["advanced_unitid"])
            : null,
        brand: json["blser_BrandShop"] != null
            ? Brand.fromJson(json["blser_BrandShop"])
            : null,
        property: json["blser_Property"] != null
            ? Project.fromJson(json["blser_Property"])
            : null,
      );
}
