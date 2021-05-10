class ApplicationList {
  String status;
  List<Data> data;

  ApplicationList({this.status, this.data});

  ApplicationList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int userId;
  String name;
  String email;
  String password;
  int phoneNo;
  String nid;
  int age;
  String location;
  String occupation;
  int applicationId;
  String submissionDate;
  String adminComment;
  String vaccinationCenter;

  Data(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.phoneNo,
      this.nid,
      this.age,
      this.location,
      this.occupation,
      this.applicationId,
      this.submissionDate,
      this.adminComment,
      this.vaccinationCenter});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNo = json['phone_no'];
    nid = json['nid'];
    age = json['age'];
    location = json['location'];
    occupation = json['occupation'];
    applicationId = json['application_id'];
    submissionDate = json['submission_date'];
    adminComment = json['admin_comment'];
    vaccinationCenter = json['vaccination_center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_no'] = this.phoneNo;
    data['nid'] = this.nid;
    data['age'] = this.age;
    data['location'] = this.location;
    data['occupation'] = this.occupation;
    data['application_id'] = this.applicationId;
    data['submission_date'] = this.submissionDate;
    data['admin_comment'] = this.adminComment;
    data['vaccination_center'] = this.vaccinationCenter;
    return data;
  }
}