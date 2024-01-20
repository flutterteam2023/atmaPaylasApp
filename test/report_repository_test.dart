// data_repository.dart

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class DataRepository {
  Future<String> fetchData() async {
    // Burada gerçek bir API çağrısı olmalıdır, ancak test sırasında bu kullanılamaz.
    // Bu nedenle sadece sahte bir değer döndürüyoruz.
    await Future.delayed(Durations.extralong1);

    return 'Sample Data';
  }
}

// data_repository_test.dart

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('DataRepository Tests', () {
    test('Fetching data from API should return valid data', () async {
      final repository = AuthRepository(); // Repository'nin doğru şekilde oluşturulduğundan emin olun

      // Repository'den veriyi çek
      final data = await repository.login('berkeugur67@gmail.com', '123456');
      Log.success(data);
      // API'den alınan veriyi kontrol et

      expect(data.isLeft(), true);
    });

    // Başka test senaryolarını buraya ekleyebilirsiniz.
  });
}
