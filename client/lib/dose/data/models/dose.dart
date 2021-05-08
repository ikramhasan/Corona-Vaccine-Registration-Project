class Dose {
  String status;
  List<Data> data;

  Dose({this.status, this.data});

  Dose.fromJson(Map<String, dynamic> json) {
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
  int doseId;
  int userId;
  int doseNo;
  String date;
  String status;

  Data({this.doseId, this.userId, this.doseNo, this.date, this.status});

  Data.fromJson(Map<String, dynamic> json) {
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