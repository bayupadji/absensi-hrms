class GetAnnouncement {
  final int status;
  final String message;
  final List<Announcement> data;

  GetAnnouncement({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAnnouncement.fromJson(Map<String, dynamic> json) {
    return GetAnnouncement(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?) ?.map((item) => Announcement.fromJson(item)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((announcement) => announcement.toJson()).toList(),
    };
  }
}

class Announcement {
  final int id;
  final String judul;
  final String konten;
  final int isRead;
  final DateTime tglMulai;
  final DateTime tglBerakhir;
  final DateTime updatedAt;

  Announcement({
    required this.id,
    required this.judul,
    required this.konten,
    required this.isRead,
    required this.tglMulai,
    required this.tglBerakhir,
    required this.updatedAt,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'] ?? 0,
      judul: json['judul'] ?? '',
      konten: json['konten'] ?? '',
      isRead: json['is_read'] ?? 0,
      tglMulai: json['tgl_mulai'] != null ? DateTime.parse(json['tgl_mulai']) : DateTime.now(),
      tglBerakhir: json['tgl_berakhir'] != null ? DateTime.parse(json['tgl_berakhir']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'konten': konten,
      'is_read': isRead,
      'tgl_mulai': tglMulai.toIso8601String(),
      'tgl_berakhir': tglBerakhir.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Helper methods
  bool get isExpired => DateTime.now().isAfter(tglBerakhir);
  bool get isActive => DateTime.now().isAfter(tglMulai) && DateTime.now().isBefore(tglBerakhir);
}
