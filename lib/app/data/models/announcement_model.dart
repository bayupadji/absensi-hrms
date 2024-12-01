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
    var announcementList = json['data'] as List;
    List<Announcement> announcements =
        announcementList.map((i) => Announcement.fromJson(i)).toList();

    return GetAnnouncement(
      status: json['status'],
      message: json['message'],
      data: announcements,
    );
  }
}

class Announcement {
  final int id;
  final String userId;
  final String judul;
  final String konten;
  final int isRead;
  final DateTime tglMulai;
  final DateTime tglBerakhir;
  final DateTime createdAt;
  final DateTime updatedAt;
  String? formattedExpiryDate;

  Announcement({
    required this.id,
    required this.userId,
    required this.judul,
    required this.konten,
    required this.isRead,
    required this.tglMulai,
    required this.tglBerakhir,
    required this.createdAt,
    required this.updatedAt,
    this.formattedExpiryDate
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      userId: json['user_id'],
      judul: json['judul'],
      konten: json['konten'],
      isRead: json['is_read'],
      tglMulai: DateTime.parse(json['tgl_mulai']),
      tglBerakhir: DateTime.parse(json['tgl_berakhir']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
