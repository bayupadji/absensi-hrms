class EmployeeSmSchedule {
  final int status;
  final String message;
  final List<Employee> data;

  EmployeeSmSchedule({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EmployeeSmSchedule.fromJson(Map<String, dynamic> json) {
    return EmployeeSmSchedule(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => Employee.fromJson(item))
          .toList(),
    );
  }
}

class Employee {
  final int userId;
  final String nama;
  final String? fotoProfil;
  final String namaKompetensi;
  final String labelStatusKaryawan;

  Employee({
    required this.userId,
    required this.nama,
    this.fotoProfil,
    required this.namaKompetensi,
    required this.labelStatusKaryawan,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      userId: json['user_id'],
      nama: json['user']['nama'],
      fotoProfil: json['user']['foto_profil'],
      namaKompetensi: json['kompetensi']['nama_kompetensi'],
      labelStatusKaryawan: json['status_karyawan']['label'],
    );
  }
}
