class Attachment {
  String? noteText;
  String? objectTypeCode;
  String? mimeType;
  String? filename;
  String? objectIdValue;
  int? fileSize;
  DateTime? createdOn;
  String? documentBody;
  String? id;

  Attachment({
    this.noteText,
    this.objectTypeCode,
    this.mimeType,
    this.filename,
    this.objectIdValue,
    this.fileSize,
    this.createdOn,
    this.documentBody,
    this.id,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    noteText: json["notetext"],
    objectTypeCode: json["objecttypecode"],
    mimeType: json["mimetype"],
    filename: json["filename"],
    objectIdValue: json["_objectid_value"],
    fileSize: json["filesize"],
    createdOn: json["createdon"] == null ? null : DateTime.parse(json["createdon"]),
    documentBody: json["documentbody"],
    id: json["annotationid"],
  );

  Map<String, dynamic> toJson() => {
    "notetext": noteText,
    "objecttypecode": objectTypeCode,
    "mimetype": mimeType,
    "filename": filename,
    "_objectid_value": objectIdValue,
    "filesize": fileSize,
    "createdon": createdOn?.toIso8601String(),
    "documentbody": documentBody,
    "annotationid": id,
  };
}
