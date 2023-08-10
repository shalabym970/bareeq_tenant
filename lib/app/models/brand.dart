class Brand {
  String? name;
  String? id;

  Brand({
    this.name,
    this.id,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["blser_name"],
        id: json["blser_erpshopid"],
      );

  Map<String, dynamic> toJson() => {
        "blser_name": name,
        "blser_erpshopid": id,
      };
}
