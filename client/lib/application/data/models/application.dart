// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

import 'dart:convert';

Application applicationFromJson(String str) =>
    Application.fromJson(json.decode(str));

String applicationToJson(Application data) => json.encode(data.toJson());

class Application {
  Application({
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

  factory Application.fromJson(Map<String, dynamic> json) => Application(
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
