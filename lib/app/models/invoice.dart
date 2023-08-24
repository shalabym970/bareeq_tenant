class Invoice {
  Invoice(
      {this.totalAmountLessFreight,
      this.transactionCurrencyId,
      this.paymentType,
      this.freightAmount,
      this.erpId,
      this.emailAddress,
      this.name,
      this.totalAmount,
      this.amountPaid,
      this.totalLineItemAmount,
      this.id,
      this.invoiceNumber,
      this.priorityCode,
      this.createdOn,
      this.deliveredDate,
      this.ownerId,
      this.amountDueRemaining,
      this.customerIdValue,
      this.stateCode,
      this.totalDiscountAmount,
      this.totalTax,
      this.statusCode,
      this.description,
      this.discountAmount,
      this.discountPercentage,
      this.dueDate,
      this.advancedPropertyContractId});

  double? totalAmountLessFreight;
  String? transactionCurrencyId;
  int? paymentType;
  double? freightAmount;
  String? erpId;
  String? emailAddress;
  String? name;
  double? totalAmount;
  double? amountPaid;
  double? totalLineItemAmount;
  String? id;
  String? invoiceNumber;
  int? priorityCode;
  DateTime? createdOn;
  String? deliveredDate;
  String? ownerId;
  dynamic amountDueRemaining;
  String? customerIdValue;
  int? stateCode;
  double? totalDiscountAmount;
  double? totalTax;
  int? statusCode;
  String? description;
  double? discountAmount;
  double? discountPercentage;
  DateTime? dueDate;
  String? advancedPropertyContractId;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        totalAmountLessFreight: json["totalamountlessfreight"],
        transactionCurrencyId: json["_transactioncurrencyid_value"],
        paymentType: json["blser_paymenttype"],
        freightAmount: json["freightamount"],
        erpId: json["new_erpid"],
        emailAddress: json["emailaddress"],
        name: json["name"],
        totalAmount: json["totalamount"],
        amountPaid: json["blser_amountpaid"],
        totalLineItemAmount: json["totallineitemamount"],
        id: json["invoiceid"],
        invoiceNumber: json["invoicenumber"],
        priorityCode: json["prioritycode"],
        createdOn: json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        deliveredDate: json["datedelivered"],
        ownerId: json["_ownerid_value"] ?? 'null',
        amountDueRemaining: json["blser_amountdueremaining"],
        customerIdValue: json["_customerid_value"],
        stateCode: json["statecode"],
        totalDiscountAmount: json["totaldiscountamount"],
        totalTax: json["totaltax"],
        statusCode: json["statuscode"],
        description: json["description"],
        discountAmount: json["discountamount"],
        discountPercentage: json["discountpercentage"],
        dueDate: json["duedate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["duedate"]),
        advancedPropertyContractId: json["_advanced_propertycontractid_value"],
      );
}
