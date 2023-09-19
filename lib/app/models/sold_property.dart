import 'package:bareeq/app/models/project.dart';
import 'package:bareeq/app/models/unit.dart';

class SoldProperty {
  int? agreementType;
  DateTime? transferDate;
  DateTime? agreementDate;
  String? agreementRef;
  String? name;
  int? agreementStatus;
  Unit? unit;
  Project? property;
  String? id;

  SoldProperty({
    this.agreementType,
    this.transferDate,
    this.agreementDate,
    this.agreementRef,
    this.name,
    this.agreementStatus,
    this.id,
    this.unit,
    this.property,
  });

  factory SoldProperty.fromJson(Map<String, dynamic> json) => SoldProperty(
        agreementType: json["blser_agreementtype"],
        transferDate: json["blser_transferdate"] == null
            ? null
            : DateTime.parse(json["blser_transferdate"]),
        agreementDate: json["blser_agreementdate"] == null
            ? null
            : DateTime.parse(json["blser_agreementdate"]),
        agreementRef: json["blser_agreementref"],
        name: json["blser_name"],
        agreementStatus: json["blser_agreementstatus"],
        id: json["blser_propertyagreementid"],
        unit: json["blser_PropertyUnit"] != null
            ? Unit.fromJson(json["blser_PropertyUnit"])
            : null,
        property: json["blser_Property"] != null
            ? Project.fromJson(json["blser_Property"])
            : null,
      );
}
