import 'invoice_details.dart';

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
      this.invoiceId,
      this.invoiceNumber,
      this.priorityCode,
      this.createdOn,
      this.deliveredDate,
      this.ownerId,
      this.amountDueRemaining,
      this.customerIdValue,
      this.paymentTermsCode,
      this.stateCode,
      this.totalDiscountAmount,
      this.totalTax,
      this.statusCode,
      this.paymentMethod,
      this.erpInvoiceType,
      this.description,
      this.discountAmount,
      this.discountPercentage,
      this.dueDate,
      this.advancedPropertyContractId,
      this.invoiceDetails});

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
  String? invoiceId;
  String? invoiceNumber;
  int? priorityCode;
  DateTime? createdOn;
  String? deliveredDate;
  String? ownerId;
  dynamic amountDueRemaining;
  String? customerIdValue;
  dynamic paymentTermsCode;
  int? stateCode;
  double? totalDiscountAmount;
  double? totalTax;
  int? statusCode;
  dynamic paymentMethod;
  dynamic erpInvoiceType;
  String? description;
  double? discountAmount;
  double? discountPercentage;
  DateTime? dueDate;
  String? advancedPropertyContractId;
  List<InvoiceDetails>? invoiceDetails;

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
        invoiceId: json["invoiceid"],
        invoiceNumber: json["invoicenumber"],
        priorityCode: json["prioritycode"],
        createdOn: DateTime.parse(json["createdon"] ?? DateTime(0000, 00, 00)),
        deliveredDate:
            json["datedelivered"] ,
        ownerId: json["_ownerid_value"],
        amountDueRemaining: json["blser_amountdueremaining"],
        customerIdValue: json["_customerid_value"],
        paymentTermsCode: json["paymenttermscode"],
        stateCode: json["statecode"],
        totalDiscountAmount: json["totaldiscountamount"],
        totalTax: json["totaltax"],
        statusCode: json["statuscode"],
        paymentMethod: json["blser_paymentmethod"],
        erpInvoiceType: json["blser_erpinvoicetype"],
        description: json["description"],
        discountAmount: json["discountamount"],
        discountPercentage: json["discountpercentage"],
        dueDate: DateTime.parse(json["duedate"] ?? DateTime(0000, 00, 00)),
        advancedPropertyContractId: json["_advanced_propertycontractid_value"],
        invoiceDetails: List<InvoiceDetails>.from(
            json["invoice_details"].map((x) => InvoiceDetails.fromJson(x))),
      );
}
