class ActivityAttendModel {
  final int? status;
  final String? message;
  final List<ActivityData>? data;

  const ActivityAttendModel({this.status, this.message, this.data});

  factory ActivityAttendModel.fromJson(Map<String, dynamic> json) {
    return ActivityAttendModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? List<ActivityData>.from(
          json['data'].map((v) => ActivityData.fromJson(v))
          )
        : null
      );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((v) => v.toJson()).toList()
  };
}

class ActivityData {
  final int id;
  final String? presensi;
  final String? tanggal;
  final String? jam;

  const ActivityData({
    required this.id,
    this.presensi,
    this.tanggal,
    this.jam
  });

  factory ActivityData.fromJson(Map<String, dynamic> json) {
    return ActivityData(
      id: json['id'],
      presensi: json['presensi'],
      tanggal: json['tanggal'],
      jam: json['jam']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'presensi': presensi,
    'tanggal': tanggal,
    'jam': jam
  };
}
