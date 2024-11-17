class MdlLogin {
  User? user;
  String? token;

  MdlLogin({this.user, this.token});

  MdlLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? status;
  String? message;
  Data? data;

  User({this.status, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  String? email;
  String? username;
  dynamic fotoProfil;  // Ubah Null? menjadi dynamic
  int? statusAktif;
  int? dataCompletionStep;
  DataKaryawan? dataKaryawan;
  Role? role;
  List<int>? permission;
  List<dynamic>? potonganGaji;  // Ubah List<Null>? menjadi List<dynamic>?
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.nama,
    this.email,
    this.username,
    this.fotoProfil,
    this.statusAktif,
    this.dataCompletionStep,
    this.dataKaryawan,
    this.role,
    this.permission,
    this.potonganGaji,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    fotoProfil = json['foto_profil'];
    statusAktif = json['status_aktif'];
    dataCompletionStep = json['data_completion_step'];
    dataKaryawan = json['data_karyawan'] != null
        ? new DataKaryawan.fromJson(json['data_karyawan'])
        : null;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    permission = json['permission'].cast<int>();
    
    // Perbaiki bagian ini
    potonganGaji = json['potongan_gaji'] != null 
        ? List<dynamic>.from(json['potongan_gaji'])
        : null;
        
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['username'] = this.username;
    data['foto_profil'] = this.fotoProfil;
    data['status_aktif'] = this.statusAktif;
    data['data_completion_step'] = this.dataCompletionStep;

    if (this.dataKaryawan != null) {
      data['data_karyawan'] = this.dataKaryawan!.toJson();
    }

    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }

    data['permission'] = this.permission;

    if (this.potonganGaji != null) {
      data['potongan_gaji'] = this.potonganGaji;
    }

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DataKaryawan {
  int? id;
  String? email;
  String? nik;
  String? noRm;
  String? noSip;
  Null? masaBerlakuSip;
  String? noManulife;
  String? tglMasuk;
  UnitKerja? unitKerja;
  Jabatan? jabatan;
  Kompetensi? kompetensi;
  String? nikKtp;
  StatusKaryawan? statusKaryawan;
  String? tempatLahir;
  String? tglLahir;
  KelompokGaji? kelompokGaji;
  String? noRekening;
  int? tunjanganJabatan;
  int? tunjanganFungsional;
  int? tunjanganKhusus;
  int? tunjanganLainnya;
  int? uangLembur;
  int? uangMakan;
  Ptkp? ptkp;
  Null? tglKeluar;
  String? noKk;
  String? alamat;
  String? gelarDepan;
  String? gelarBelakang;
  String? noHp;
  String? noBpjsksh;
  String? noBpjsktk;
  String? tglDiangkat;
  Null? masaKerja;
  String? npwp;
  int? jenisKelamin;
  StatusKaryawan? agama;
  StatusKaryawan? golonganDarah;
  String? asalSekolah;
  PendidikanTerakhir? pendidikanTerakhir;
  int? tinggiBadan;
  int? beratBadan;
  String? bmiValue;
  String? bmiKet;
  String? riwayatPenyakit;
  String? noIjazah;
  int? tahunLulus;
  String? noStr;
  Null? masaBerlakuStr;
  String? tglBerakhirPks;
  int? masaDiklat;
  String? createdAt;
  String? updatedAt;

  DataKaryawan(
      {this.id,
      this.email,
      this.nik,
      this.noRm,
      this.noSip,
      this.masaBerlakuSip,
      this.noManulife,
      this.tglMasuk,
      this.unitKerja,
      this.jabatan,
      this.kompetensi,
      this.nikKtp,
      this.statusKaryawan,
      this.tempatLahir,
      this.tglLahir,
      this.kelompokGaji,
      this.noRekening,
      this.tunjanganJabatan,
      this.tunjanganFungsional,
      this.tunjanganKhusus,
      this.tunjanganLainnya,
      this.uangLembur,
      this.uangMakan,
      this.ptkp,
      this.tglKeluar,
      this.noKk,
      this.alamat,
      this.gelarDepan,
      this.gelarBelakang,
      this.noHp,
      this.noBpjsksh,
      this.noBpjsktk,
      this.tglDiangkat,
      this.masaKerja,
      this.npwp,
      this.jenisKelamin,
      this.agama,
      this.golonganDarah,
      this.asalSekolah,
      this.pendidikanTerakhir,
      this.tinggiBadan,
      this.beratBadan,
      this.bmiValue,
      this.bmiKet,
      this.riwayatPenyakit,
      this.noIjazah,
      this.tahunLulus,
      this.noStr,
      this.masaBerlakuStr,
      this.tglBerakhirPks,
      this.masaDiklat,
      this.createdAt,
      this.updatedAt});

  DataKaryawan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nik = json['nik'];
    noRm = json['no_rm'];
    noSip = json['no_sip'];
    masaBerlakuSip = json['masa_berlaku_sip'];
    noManulife = json['no_manulife'];
    tglMasuk = json['tgl_masuk'];
    unitKerja = json['unit_kerja'] != null
        ? new UnitKerja.fromJson(json['unit_kerja'])
        : null;
    jabatan =
        json['jabatan'] != null ? new Jabatan.fromJson(json['jabatan']) : null;
    kompetensi = json['kompetensi'] != null
        ? new Kompetensi.fromJson(json['kompetensi'])
        : null;
    nikKtp = json['nik_ktp'];
    statusKaryawan = json['status_karyawan'] != null
        ? new StatusKaryawan.fromJson(json['status_karyawan'])
        : null;
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    kelompokGaji = json['kelompok_gaji'] != null
        ? new KelompokGaji.fromJson(json['kelompok_gaji'])
        : null;
    noRekening = json['no_rekening'];
    tunjanganJabatan = json['tunjangan_jabatan'];
    tunjanganFungsional = json['tunjangan_fungsional'];
    tunjanganKhusus = json['tunjangan_khusus'];
    tunjanganLainnya = json['tunjangan_lainnya'];
    uangLembur = json['uang_lembur'];
    uangMakan = json['uang_makan'];
    ptkp = json['ptkp'] != null ? new Ptkp.fromJson(json['ptkp']) : null;
    tglKeluar = json['tgl_keluar'];
    noKk = json['no_kk'];
    alamat = json['alamat'];
    gelarDepan = json['gelar_depan'];
    gelarBelakang = json['gelar_belakang'];
    noHp = json['no_hp'];
    noBpjsksh = json['no_bpjsksh'];
    noBpjsktk = json['no_bpjsktk'];
    tglDiangkat = json['tgl_diangkat'];
    masaKerja = json['masa_kerja'];
    npwp = json['npwp'];
    jenisKelamin = json['jenis_kelamin'];
    agama = json['agama'] != null
        ? new StatusKaryawan.fromJson(json['agama'])
        : null;
    golonganDarah = json['golongan_darah'] != null
        ? new StatusKaryawan.fromJson(json['golongan_darah'])
        : null;
    asalSekolah = json['asal_sekolah'];
    pendidikanTerakhir = json['pendidikan_terakhir'] != null
        ? new PendidikanTerakhir.fromJson(json['pendidikan_terakhir'])
        : null;
    tinggiBadan = json['tinggi_badan'];
    beratBadan = json['berat_badan'];
    bmiValue = json['bmi_value'];
    bmiKet = json['bmi_ket'];
    riwayatPenyakit = json['riwayat_penyakit'];
    noIjazah = json['no_ijazah'];
    tahunLulus = json['tahun_lulus'];
    noStr = json['no_str'];
    masaBerlakuStr = json['masa_berlaku_str'];
    tglBerakhirPks = json['tgl_berakhir_pks'];
    masaDiklat = json['masa_diklat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nik'] = this.nik;
    data['no_rm'] = this.noRm;
    data['no_sip'] = this.noSip;
    data['masa_berlaku_sip'] = this.masaBerlakuSip;
    data['no_manulife'] = this.noManulife;
    data['tgl_masuk'] = this.tglMasuk;
    if (this.unitKerja != null) {
      data['unit_kerja'] = this.unitKerja!.toJson();
    }
    if (this.jabatan != null) {
      data['jabatan'] = this.jabatan!.toJson();
    }
    if (this.kompetensi != null) {
      data['kompetensi'] = this.kompetensi!.toJson();
    }
    data['nik_ktp'] = this.nikKtp;
    if (this.statusKaryawan != null) {
      data['status_karyawan'] = this.statusKaryawan!.toJson();
    }
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    if (this.kelompokGaji != null) {
      data['kelompok_gaji'] = this.kelompokGaji!.toJson();
    }
    data['no_rekening'] = this.noRekening;
    data['tunjangan_jabatan'] = this.tunjanganJabatan;
    data['tunjangan_fungsional'] = this.tunjanganFungsional;
    data['tunjangan_khusus'] = this.tunjanganKhusus;
    data['tunjangan_lainnya'] = this.tunjanganLainnya;
    data['uang_lembur'] = this.uangLembur;
    data['uang_makan'] = this.uangMakan;
    if (this.ptkp != null) {
      data['ptkp'] = this.ptkp!.toJson();
    }
    data['tgl_keluar'] = this.tglKeluar;
    data['no_kk'] = this.noKk;
    data['alamat'] = this.alamat;
    data['gelar_depan'] = this.gelarDepan;
    data['gelar_belakang'] = this.gelarBelakang;
    data['no_hp'] = this.noHp;
    data['no_bpjsksh'] = this.noBpjsksh;
    data['no_bpjsktk'] = this.noBpjsktk;
    data['tgl_diangkat'] = this.tglDiangkat;
    data['masa_kerja'] = this.masaKerja;
    data['npwp'] = this.npwp;
    data['jenis_kelamin'] = this.jenisKelamin;
    if (this.agama != null) {
      data['agama'] = this.agama!.toJson();
    }
    if (this.golonganDarah != null) {
      data['golongan_darah'] = this.golonganDarah!.toJson();
    }
    data['asal_sekolah'] = this.asalSekolah;
    if (this.pendidikanTerakhir != null) {
      data['pendidikan_terakhir'] = this.pendidikanTerakhir!.toJson();
    }
    data['tinggi_badan'] = this.tinggiBadan;
    data['berat_badan'] = this.beratBadan;
    data['bmi_value'] = this.bmiValue;
    data['bmi_ket'] = this.bmiKet;
    data['riwayat_penyakit'] = this.riwayatPenyakit;
    data['no_ijazah'] = this.noIjazah;
    data['tahun_lulus'] = this.tahunLulus;
    data['no_str'] = this.noStr;
    data['masa_berlaku_str'] = this.masaBerlakuStr;
    data['tgl_berakhir_pks'] = this.tglBerakhirPks;
    data['masa_diklat'] = this.masaDiklat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UnitKerja {
  int? id;
  String? namaUnit;
  int? jenisKaryawan;
  Null? deletedAt;
  Null? createdAt;
  String? updatedAt;

  UnitKerja(
      {this.id,
      this.namaUnit,
      this.jenisKaryawan,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  UnitKerja.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaUnit = json['nama_unit'];
    jenisKaryawan = json['jenis_karyawan'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_unit'] = this.namaUnit;
    data['jenis_karyawan'] = this.jenisKaryawan;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Jabatan {
  int? id;
  String? namaJabatan;
  int? isStruktural;
  int? tunjanganJabatan;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Jabatan(
      {this.id,
      this.namaJabatan,
      this.isStruktural,
      this.tunjanganJabatan,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Jabatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJabatan = json['nama_jabatan'];
    isStruktural = json['is_struktural'];
    tunjanganJabatan = json['tunjangan_jabatan'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_jabatan'] = this.namaJabatan;
    data['is_struktural'] = this.isStruktural;
    data['tunjangan_jabatan'] = this.tunjanganJabatan;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Kompetensi {
  int? id;
  String? namaKompetensi;
  int? jenisKompetensi;
  int? nilaiBor;
  Null? deletedAt;
  String? createdAt;
  Null? updatedAt;

  Kompetensi(
      {this.id,
      this.namaKompetensi,
      this.jenisKompetensi,
      this.nilaiBor,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Kompetensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKompetensi = json['nama_kompetensi'];
    jenisKompetensi = json['jenis_kompetensi'];
    nilaiBor = json['nilai_bor'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kompetensi'] = this.namaKompetensi;
    data['jenis_kompetensi'] = this.jenisKompetensi;
    data['nilai_bor'] = this.nilaiBor;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class StatusKaryawan {
  int? id;
  String? label;
  String? createdAt;
  String? updatedAt;

  StatusKaryawan({this.id, this.label, this.createdAt, this.updatedAt});

  StatusKaryawan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class KelompokGaji {
  int? id;
  String? namaKelompok;
  int? besaranGaji;
  Null? deletedAt;
  Null? createdAt;
  String? updatedAt;

  KelompokGaji(
      {this.id,
      this.namaKelompok,
      this.besaranGaji,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  KelompokGaji.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKelompok = json['nama_kelompok'];
    besaranGaji = json['besaran_gaji'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kelompok'] = this.namaKelompok;
    data['besaran_gaji'] = this.besaranGaji;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Ptkp {
  int? id;
  String? kodePtkp;
  int? kategoriTerId;
  int? nilai;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Ptkp(
      {this.id,
      this.kodePtkp,
      this.kategoriTerId,
      this.nilai,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Ptkp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodePtkp = json['kode_ptkp'];
    kategoriTerId = json['kategori_ter_id'];
    nilai = json['nilai'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_ptkp'] = this.kodePtkp;
    data['kategori_ter_id'] = this.kategoriTerId;
    data['nilai'] = this.nilai;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PendidikanTerakhir {
  int? id;
  String? label;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  PendidikanTerakhir(
      {this.id, this.label, this.deletedAt, this.createdAt, this.updatedAt});

  PendidikanTerakhir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.name, this.deskripsi, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['deskripsi'] = this.deskripsi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}