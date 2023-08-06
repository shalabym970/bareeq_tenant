class Unit {
  String? name;
  int? stateCode;
  String? unitType;
  double? totalPrice;
  DateTime? createdOn;
  dynamic relatedLeaseRenewal;
  dynamic relatedLeaseContract;
  String? description;
  String? currentContract;
  String? ownerId;
  DateTime? endDate;
  DateTime? startDate;
  String? transactionCurrencyId;
  String? unitId;

  Unit({
    this.name,
    this.stateCode,
    this.unitType,
    this.totalPrice,
    this.createdOn,
    this.relatedLeaseRenewal,
    this.relatedLeaseContract,
    this.description,
    this.currentContract,
    this.ownerId,
    this.endDate,
    this.startDate,
    this.transactionCurrencyId,
    this.unitId,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        name: json["advanced_name"],
        stateCode: json["statecode"],
        unitType: json["_new_unittype_value"],
        totalPrice: json["advanced_totalprice"]?.toDouble(),
        createdOn: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        relatedLeaseRenewal: json["_bls_relatedleaserenewal_value"],
        relatedLeaseContract: json["_bls_relatedleasecontract_value"],
        description: json["advanced_description"],
        currentContract: json["_bls_currentcontract_value"],
        ownerId: json["_ownerid_value"],
        endDate: json["blser_erp_end_date"],
        startDate: json["blser_erp_start_date"],
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        unitId: json["advanced_unitid"],
      );

  Map<String, dynamic> toJson() => {
        "advanced_name": name,
        "statecode": stateCode,
        "_new_unittype_value": unitType,
        "advanced_totalprice": totalPrice,
        "createdon": createdOn?.toIso8601String(),
        "_bls_relatedleaserenewal_value": relatedLeaseRenewal,
        "_bls_relatedleasecontract_value": relatedLeaseContract,
        "advanced_description": description,
        "_bls_currentcontract_value": currentContract,
        "_ownerid_value": ownerId,
        "blser_erp_end_date": endDate,
        "blser_erp_start_date": startDate,
        "_transactioncurrencyid_value": transactionCurrencyId,
        "advanced_unitid": unitId,
      };
}
