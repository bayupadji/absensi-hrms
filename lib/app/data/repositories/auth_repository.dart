import 'package:absensi/app/data/services/database/auth_db.dart';

class AuthRepository {
  final AuthDb _authDb = AuthDb.instance;

  /// Menyimpan token ke dalam database
  Future<int> insertToken(Map<String, dynamic> tokenData) async {
    final db = await _authDb.database;
    return await db.insert('tokens', tokenData);
  }

  /// Mengambil token dari database
  Future<Map<String, dynamic>?> getToken() async {
    final db = await _authDb.database;
    final result = await db.query('tokens', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  /// Menghapus semua token dari database
  Future<void> clearTokens() async {
    final db = await _authDb.database;
    await db.delete('tokens');
  }
}
