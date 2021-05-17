class DoseEntity {
  int userId;
  DateTime date;
  int doseNo;
  String status;

  DoseEntity({this.userId, this.date, this.doseNo, this.status});

  DoseEntity.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    doseNo = json['dose_no'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date.toIso8601String();
    data['dose_no'] = this.doseNo;
    data['status'] = this.status;
    return data;
  }
}
