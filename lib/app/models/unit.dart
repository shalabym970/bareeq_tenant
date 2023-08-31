import 'contract.dart';

class Unit  {
  String? name;
  int? stateCode;
  String? unitType;
  double? totalPrice;
  DateTime? createdOn;
  String? description;
  String? currentContract;
  String? ownerId;
  DateTime? endDate;
  DateTime? startDate;
  String? transactionCurrencyId;
  String? id;
  List<Contract>? contract;

  Unit({
    this.name,
    this.stateCode,
    this.unitType,
    this.totalPrice,
    this.createdOn,
    this.description,
    this.currentContract,
    this.ownerId,
    this.endDate,
    this.startDate,
    this.transactionCurrencyId,
    this.id,
    this.contract,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        name: json["advanced_name"],
        stateCode: json["statecode"],
        unitType: json["_new_unittype_value"],
        totalPrice: json["advanced_totalprice"]?.toDouble(),
        createdOn: json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        description: json["advanced_description"],
        currentContract: json["_bls_currentcontract_value"],
        ownerId: json["_ownerid_value"],
        endDate: json["blser_erp_end_date"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_erp_end_date"]),
        startDate: json["blser_erp_start_date"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_erp_start_date"]),
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        id: json["advanced_unitid"],
        contract:
            json["advanced_advanced_unit_advanced_propertycontract"] == null
                ? []
                : List<Contract>.from(
                    json["advanced_advanced_unit_advanced_propertycontract"]!
                        .map((x) => Contract.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "advanced_name": name,
        "statecode": stateCode,
        "_new_unittype_value": unitType,
        "advanced_totalprice": totalPrice,
        "createdon": createdOn?.toIso8601String(),
        "advanced_description": description,
        "_bls_currentcontract_value": currentContract,
        "_ownerid_value": ownerId,
        "blser_erp_end_date": endDate,
        "blser_erp_start_date": startDate,
        "_transactioncurrencyid_value": transactionCurrencyId,
        "advanced_unitid": id,
        "advanced_advanced_unit_advanced_propertycontract": contract == null
            ? []
            : List<dynamic>.from(contract!.map((x) => x.toJson())),
      };
}
