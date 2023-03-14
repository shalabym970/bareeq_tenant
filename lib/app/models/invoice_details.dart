class InvoiceDetails {
  InvoiceDetails({
    this.pricePerUnit,
    this.invoiceId,
    this.baseAmount,
    this.quantity,
    this.productName,
    this.transactionCurrencyId,
    this.invoiceDetailsId,
    this.productId,
  });


  double? pricePerUnit;
  String? invoiceId;
  double? baseAmount;
  double? quantity;
  String? productName;
  String? transactionCurrencyId;
  String? invoiceDetailsId;
  String? productId;

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) => InvoiceDetails(
    pricePerUnit: json["priceperunit"],
    invoiceId: json["_invoiceid_value"],
    baseAmount: json["baseamount"],
    quantity: json["quantity"],
    productName: json["productname"],
    transactionCurrencyId: json["_transactioncurrencyid_value"],
    invoiceDetailsId: json["invoicedetailid"],
    productId: json["productid"],
  );

}
