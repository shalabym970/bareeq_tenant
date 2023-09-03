import 'package:equatable/equatable.dart';

import 'account_model.dart';

class Contact extends Equatable {
  const Contact(
      {this.emailAddress,
      this.fullName,
      this.customerSizeCode,
      this.createdOn,
      this.callback,
      this.accountCustomerId,
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
      this.jobTile});

  final String? emailAddress;
  final String? fullName;
  final int? customerSizeCode;
  final DateTime? createdOn;
  final String? callback;
  final String? accountCustomerId;
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
  final String? jobTile;
  final Account? account;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        emailAddress: json["emailaddress1"],
        fullName: json["fullname"],
        customerSizeCode: json["customersizecode"],
        createdOn: json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        callback: json["callback"],
        accountCustomerId: json["_parentcustomerid_value"],
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        id: json["contactid"],
        company: json["company"],
        country: json["blser_country"],
        department: json["department"],
        lastName: json["lastname"],
        firstName: json["firstname"],
        password: json['blser_password'],
        cprNumber: json["bls_cprnumber"],
        crNumber: json["bls_crnumber"],
        mobilePhone: json["mobilephone"],
        businessPhone: json["telephone1"],
        jobTile: json["jobtitle"],
        account: json["parentcustomerid_account"] != null
            ? Account.fromJson(json["parentcustomerid_account"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "emailaddress1": emailAddress,
        "parentcustomerid_account@odata.bind": "/accounts($accountCustomerId)",
        "lastname": lastName,
        "firstname": firstName,
        'mobilephone': mobilePhone,
        'telephone1': businessPhone,
        "jobtitle": jobTile
      };

  @override
  List<Object?> get props => [emailAddress, password];
}
