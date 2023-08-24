class InvoiceItem {
  InvoiceItem({
    this.pricePerUnit,
    this.baseAmount,
    this.quantity,
    this.productName,
    this.transactionCurrencyId,
    this.invoiceDetailsId,
    this.productId,
  });


  double? pricePerUnit;
  double? baseAmount;
  double? quantity;
  String? productName;
  String? transactionCurrencyId;
  String? invoiceDetailsId;
  String? productId;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
    pricePerUnit: json["priceperunit"],
    baseAmount: json["baseamount"],
    quantity: json["quantity"],
    productName: json["productname"],
    transactionCurrencyId: json["_transactioncurrencyid_value"],
    invoiceDetailsId: json["invoicedetailid"],
    productId: json["productid"],
  );

}
