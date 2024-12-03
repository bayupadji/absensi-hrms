class Schedule {
  final int? status;
  final String? message;
  final List<Data>? data;

  Schedule({this.status, this.message, this.data});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? List<Data>.from(json['data'].map((item) => Data.fromJson(item)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Data {
  final int? id;
  final int? userId;
  final String? tglMulai;
  final String? tglSelesai;
  final int? shiftId;
  final String? createdAt;
  final String? updatedAt;
  final Shift? shift;

  Data({
    this.id,
    this.userId,
    this.tglMulai,
    this.tglSelesai,
    this.shiftId,
    this.createdAt,
    this.updatedAt,
    this.shift,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      tglMulai: json['tgl_mulai'] as String?,
      tglSelesai: json['tgl_selesai'] as String?,
      shiftId: json['shift_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
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
      'created_at': createdAt,
      'updated_at': updatedAt,
      'shift': shift?.toJson(),
    };
  }
}

class Shift {
  final int? id;
  final String? nama;
  final String? jamFrom;
  final String? jamTo;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  Shift({
    this.id,
    this.nama,
    this.jamFrom,
    this.jamTo,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'] as int?,
      nama: json['nama'] as String?,
      jamFrom: json['jam_from'] as String?,
      jamTo: json['jam_to'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'jam_from': jamFrom,
      'jam_to': jamTo,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}