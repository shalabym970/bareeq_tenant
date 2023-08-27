class FitOutStepTask {
  String? subject;
  String? stepId;
  String? id;

  FitOutStepTask({
    this.subject,
    this.stepId,
    this.id,
  });

  factory FitOutStepTask.fromJson(Map<String, dynamic> json) => FitOutStepTask(
        subject: json["subject"],
        stepId: json["_regardingobjectid_value"],
        id: json["activityid"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "_regardingobjectid_value": stepId,
      };
}
