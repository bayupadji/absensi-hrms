class TodayScheduleParameter {
  final int? status;
  final String? message;
  final Data? data;

  TodayScheduleParameter({this.status, this.message, this.data});

  factory TodayScheduleParameter.fromJson(Map<String, dynamic> json) {
    return TodayScheduleParameter(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final int? id;
  final int? userId;
  final String? tglMulai;
  final String? tglSelesai;
  final int? shiftId;
  final String? officeLat;
  final String? officeLong;
  final int? radius;
  final bool? aktivitas;
  final Shift? shift;

  Data({
    this.id,
    this.userId,
    this.tglMulai,
    this.tglSelesai,
    this.shiftId,
    this.officeLat,
    this.officeLong,
    this.radius,
    this.aktivitas,
    this.shift,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      userId: json['user_id'],
      tglMulai: json['tgl_mulai'],
      tglSelesai: json['tgl_selesai'],
      shiftId: json['shift_id'],
      officeLat: json['office_lat'],
      officeLong: json['office_long'],
      radius: json['radius'],
      aktivitas: json['aktivitas'],
      shift: json['shift'] != null ? Shift.fromJson(json['shift']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'tgl_mulai': tglMulai,
      'tgl_selesai': tglSelesai,
      'shift_id': shiftId,
      'office_lat': officeLat,
      'office_long': officeLong,
      'radius': radius,
      'aktivitas': aktivitas,
      'shift': shift?.toJson(),
    };
  }
}

class Shift {
  final int? id;
  final String? nama;
  final String? jamFrom;
  final String? jamTo;

  Shift({
    this.id,
    this.nama,
    this.jamFrom,
    this.jamTo,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'],
      nama: json['nama'],
      jamFrom: json['jam_from'],
      jamTo: json['jam_to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'jam_from': jamFrom,
      'jam_to': jamTo,
    };
  }
}
