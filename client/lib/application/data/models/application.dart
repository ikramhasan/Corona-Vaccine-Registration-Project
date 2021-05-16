// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

import 'dart:convert';

ApplicationEntity applicationFromJson(String str) =>
    ApplicationEntity.fromJson(json.decode(str));

String applicationToJson(ApplicationEntity data) => json.encode(data.toJson());

class ApplicationEntity {
  ApplicationEntity({
    this.applicationId,
    this.userId,
    this.submissionDate,
    this.adminComment,
    this.vaccinationCenter,
  });

  int applicationId;
  int userId;
  DateTime submissionDate;
  String adminComment;
  String vaccinationCenter;

  factory ApplicationEntity.fromJson(Map<String, dynamic> json) =>
      ApplicationEntity(
        applicationId: json["application_id"],
        userId: json["user_id"],
        submissionDate: DateTime.parse(json["submission_date"]),
        adminComment: json["admin_comment"],
        vaccinationCenter: json["vaccination_center"],
      );

  Map<String, dynamic> toJson() => {
        "application_id": applicationId,
        "user_id": userId,
        "submission_date": submissionDate.toIso8601String(),
        "admin_comment": adminComment,
        "vaccination_center": vaccinationCenter,
      };

  @override
  String toString() =>
      'Application(id: $applicationId, user_id: $userId, submission_date: ${submissionDate.toIso8601String()}, admin_comment: $adminComment, vaccination_center: $vaccinationCenter';
}
