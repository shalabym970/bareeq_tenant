class Account {
  Account({
    this.name,
    this.id,
    this.primaryContactId,
    this.accountStatus,
    this.ownerId,
    this.emailAddress,
    this.accountType,
    this.crNumber,
    this.cbrNumber,
  });

  final String? name;
  final String? id;
  final String? primaryContactId;
  final String? accountStatus;
  final String? ownerId;
  final String? emailAddress;
  final String? accountType;
  final String? crNumber;
  final String? cbrNumber;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
      name: json["name"],
      id: json["accountid"],
      primaryContactId: json["_primarycontactid_value"],
      accountStatus: json["bls_accountstatus@OData.Community.Display.V1.FormattedValue"],
      ownerId: json["_ownerid_value"],
      emailAddress: json["emailaddress1"],
      crNumber: json["new_registrationnumbercr"],
      accountType: json["blser_accounttype@OData.Community.Display.V1.FormattedValue"],
      cbrNumber: json['new_cbrnumber']);
}

