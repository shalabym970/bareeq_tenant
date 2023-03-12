import 'package:equatable/equatable.dart';

import 'account_model.dart';

class Contact extends Equatable {
  const Contact({
    this.emailAddress,
    this.fullName,
    this.customerSizeCode,
    this.createdOn,
    this.callback,
    this.parentCustomerId,
    this.transactionCurrencyId,
    this.id,
    this.company,
    this.country,
    this.department,
    this.lastName,
    this.firstName,
    this.password,
    this.account,
    this.crNumber,
    this.cprNumber,
    this.businessPhone,
    this.mobilePhone,
  });

  final String? emailAddress;
  final String? fullName;
  final int? customerSizeCode;
  final DateTime? createdOn;
  final String? callback;
  final String? parentCustomerId;
  final String? transactionCurrencyId;
  final String? id;
  final String? company;
  final String? country;
  final String? department;
  final String? lastName;
  final String? firstName;
  final String? password;
  final int? crNumber;
  final int? cprNumber;
  final String? businessPhone;
  final String? mobilePhone;
  final Account? account;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        emailAddress: json["emailaddress1"],
        fullName: json["yomifullname"],
        customerSizeCode: json["customersizecode"],
        createdOn: DateTime.parse(json["createdon"]),
        callback: json["callback"],
        parentCustomerId: json["_parentcustomerid_value"],
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        id: json["contactid"],
        company: json["company"],
        country: json["blser_country"],
        department: json["department"],
        lastName: json["yomilastname"],
        firstName: json["yomifirstname"],
        password: json['blser_password'],
        cprNumber: json["bls_cprnumber"],
        crNumber: json["bls_crnumber"],
        mobilePhone: json["mobilephone"],
        businessPhone: json["telephone1"],
        account: Account.fromJson(json["parentcustomerid_account"]),
      );

  Map<String, dynamic> toJson() => {
        "emailaddress1": emailAddress,
        "fullname": fullName,
        "customersizecode": customerSizeCode,
        "createdon": createdOn!.toIso8601String(),
        "callback": callback,
        "_parentcustomerid_value": parentCustomerId,
        "_transactioncurrencyid_value": transactionCurrencyId,
        "contactid": id,
        "company": company,
        "blser_country": country,
        "department": department,
        "lastname": lastName,
        "firstname": firstName,
        'blser_password': password,
        'bls_cprnumber': cprNumber,
        'bls_crnumber': crNumber,
        'mobilephone': mobilePhone,
        'telephone1': businessPhone
      };

  @override
  List<Object?> get props => [emailAddress, password];
}
