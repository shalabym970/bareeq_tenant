class Account {
  Account({
    this.name,
    this.id,
    this.primaryContactId,
    this.accountStatus,
    this.ownerId,
    this.accountNumber,
    this.emailAddress,
    this.accountType,
    this.transactionCurrencyId,
    this.crNumber,
    this.cbrNumber,
  });

  final String? name;
  final String? id;
  final String? primaryContactId;
  final String? transactionCurrencyId;
  final int? accountStatus;
  final String? ownerId;
  final String? accountNumber;
  final String? emailAddress;
  final int? accountType;
  final int? crNumber;
  final String? cbrNumber;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
      name: json["name"],
      transactionCurrencyId: json['_transactioncurrencyid_value'],
      id: json["accountid"],
      primaryContactId: json["_primarycontactid_value"],
      accountStatus: json["bls_accountstatus"],
      ownerId: json["_ownerid_value"],
      accountNumber: json["accountnumber"],
      emailAddress: json["emailaddress1"],
      crNumber: json["new_registrationnumbercr"],
      accountType: json["blser_accounttype"],
      cbrNumber: json['new_cbrnumber']);
}

