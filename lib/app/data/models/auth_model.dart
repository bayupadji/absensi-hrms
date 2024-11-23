class AuthModel {
  final int id;
  final String nama;
  final String username;
  final String? emailVerifiedAt;
  final int roleId;
  final int dataKaryawanId;
  final String? fotoProfil;
  final int dataCompletionStep;
  final int statusAktif;
  final String rememberToken;
  final String rememberTokenExpiredAt;
  final String? createdAt;
  final String? updatedAt;
  final String token;
  final List<UnitKerja> unitKerja;
  final List<Roles> roles;

  AuthModel({
    required this.id,
    required this.nama,
    required this.username,
    this.emailVerifiedAt,
    required this.roleId,
    required this.dataKaryawanId,
    this.fotoProfil,
    required this.dataCompletionStep,
    required this.statusAktif,
    required this.rememberToken,
    required this.rememberTokenExpiredAt,
    this.createdAt,
    this.updatedAt,
    required this.token,
    required this.unitKerja,
    required this.roles
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    var unitKerjaList = json['unit_kerja'] as List;
    var rolesList = json['roles'] as List;

    return AuthModel(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      emailVerifiedAt: json['email_verified_at'],
      roleId: json['role_id'],
      dataKaryawanId: json['data_karyawan_id'],
      fotoProfil: json['foto_profil'],
      dataCompletionStep: json['data_completion_step'],
      statusAktif: json['status_aktif'],
      rememberToken: json['remember_token'],
      rememberTokenExpiredAt: json['remember_token_expired_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: json['arrtoken']['token'],
      unitKerja: unitKerjaList.map((unit) => UnitKerja.fromJson(unit)).toList(),
      roles: rolesList.map((role) => Roles.fromJson(role)).toList(),
    );
  }
}

class UnitKerja {
  final int id;
  final String namaUnit;
  final int jenisKaryawan;
  final String? createdAt;
  final String? updateAt;
  final String? deletedAt;

  UnitKerja({
    required this.id,
    required this.namaUnit,
    required this.jenisKaryawan,
    this.createdAt,
    this.updateAt,
    this.deletedAt
  });

  factory UnitKerja.fromJson(Map<String, dynamic> json) {
    return UnitKerja(
      id: json['id'],
      namaUnit: json['nama_unit'],
      jenisKaryawan: json['jenis_karyawan'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class Roles {
  final int id;
  final String namaRole;
  final String? deskripsi;
  final String guardName;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  Roles({
    required this.id,
    required this.namaRole,
    this.deskripsi,
    required this.guardName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
  });

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      id: json['id'],
      namaRole: json['name'],
      deskripsi: json['deskripsi'],
      guardName: json['guard_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
