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
  Application application;
  List<DoseList> doseList;

  Data({this.application, this.doseList});

  Data.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null
        ? new Application.fromJson(json['application'])
        : null;
    if (json['dose_list'] != null) {
      doseList = new List<DoseList>();
      json['dose_list'].forEach((v) {
        doseList.add(new DoseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.application != null) {
      data['application'] = this.application.toJson();
    }
    if (this.doseList != null) {
      data['dose_list'] = this.doseList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Application {
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

  Application(
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

  Application.fromJson(Map<String, dynamic> json) {
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

class DoseList {
  int doseId;
  int userId;
  int doseNo;
  String date;
  String status;

  DoseList({this.doseId, this.userId, this.doseNo, this.date, this.status});

  DoseList.fromJson(Map<String, dynamic> json) {
    doseId = json['dose_id'];
    userId = json['user_id'];
    doseNo = json['dose_no'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dose_id'] = this.doseId;
    data['user_id'] = this.userId;
    data['dose_no'] = this.doseNo;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}
