import 'package:absensi/app/data/services/database/auth_db.dart';

class AuthRepository {
  final AuthDb _authDb = AuthDb.instance;

  // Menyimpan token ke dalam database
  Future<int> insertToken(Map<String, dynamic> tokenData) async {
    final db = await _authDb.database;
    return await db.insert('tokens', tokenData);
  }

  // Menyimpan unit kerja ke dalam database
  Future<int> insertUnitKerja(Map<String, dynamic> unitKerjaData) async {
    final db = await _authDb.database;
    return await db.insert('unit_kerja', unitKerjaData);
  }

  // Menyimpan roles ke dalam database
  Future<int> insertRole(Map<String, dynamic> roleData) async {
    final db = await _authDb.database;
    return await db.insert('roles', roleData);
  }
  

  /// Mengambil token dari database
  Future<Map<String, dynamic>?> getToken() async {
    final db = await _authDb.database;
    final result = await db.query('tokens', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  /// Mengambil unitkerja dari database
  Future<Map<String, dynamic>?> getUnitKerja() async {
    final db = await _authDb.database;
    final result = await db.query('unit_kerja', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  /// Mengambil role dari database
  Future<Map<String, dynamic>?> getRole() async {
    final db = await _authDb.database;
    final result = await db.query('roles', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  /// Menghapus semua data dari database
  Future<void> clearDb() async {
    final db = await _authDb.database;
    await db.delete('tokens');
    await db.delete('unit_kerja');
    await db.delete('roles');
  }
}
