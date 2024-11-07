import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/logging/app_logger.dart';

abstract class AppStorage {
  Future<void> writeValue({
    required String key,
    required String? value,
  });

  Future<String?> readValue({
    required String key,
  });

  Future<Map<String, String>> readAllValues();

  Future<void> deleteValue({
    required String key,
  });

  Future<void> deleteAllValues();

  // Recent Search
  Future<List<String>> readRecentSearches({
    required String key,
    String? keyword,
  });
  Future<void> writeRecentSearch({
    required String keyword,
  });
  Future<void> saveRecentSearch({
    required List<String> recentSearchesHistory,
  });
  Future<void> deleteRecentSearchItem({
    required String keyword,
  });
}

@Injectable(as: AppStorage)
class AppStorageImpl implements AppStorage {
  AppStorageImpl(this._secureStorage, this._appLogger) {
    _appLogger.logFor(this);
  }

  final FlutterSecureStorage _secureStorage;
  final AppLogger _appLogger;

  @override
  Future<void> writeValue({required String key, required String? value}) async {
    await _secureStorage.write(key: key, value: value);
    _appLogger.info('write to storage :) | key: $key | value: $value');
  }

  @override
  Future<String?> readValue({required String key}) async {
    final String? value = await _secureStorage.read(key: key);
    _appLogger.info('read from storage :) | key: $key | value: $value');

    return value;
  }

  @override
  Future<Map<String, String>> readAllValues() async {
    final Map<String, String> values = await _secureStorage.readAll();
    _appLogger.info('read all values from storage :) | value: $values');

    return values;
  }

  @override
  Future<void> deleteValue({required String key}) async {
    await _secureStorage.delete(key: key);
    _appLogger.info('delete value from storage :) | key: $key');
  }

  @override
  Future<void> deleteAllValues() async {
    await _secureStorage.deleteAll();
    _appLogger.info('delete all values from storage :)');
  }

  @override
  Future<void> saveRecentSearch({
    required List<String> recentSearchesHistory,
  }) async {
    if (recentSearchesHistory.isEmpty) {
      await _secureStorage.delete(key: 'RECENT_SEARCHES');
    } else {
      final String searchHistory = jsonEncode(recentSearchesHistory);
      await _secureStorage.write(key: 'RECENT_SEARCHES', value: searchHistory);
    }
  }

  @override
  Future<void> writeRecentSearch({
    required String keyword,
  }) async {
    // This function for add new [search value] - following step below
    // Step 1: Read Key - 'RECENT_SEARCHES'
    // Step 2: Check exist keyword, need to remove if already exist
    // Step 3: Invoke saveRecentSearch
    if (keyword.isNotEmpty) {
      final list = await readRecentSearches(key: 'RECENT_SEARCHES');
      if (list.contains(keyword)) {
        list.remove(keyword);
      }
      list.insert(0, keyword);
      await saveRecentSearch(recentSearchesHistory: list);
    }
  }

  @override
  Future<List<String>> readRecentSearches({
    required String key,
    String? keyword,
  }) async {
    // This function for read all recent search value by [key] - 'RECENT_SEARCHES'
    // U can change your key name to whatever u want 😼😼😼
    final String? value = await _secureStorage.read(key: key);
    _appLogger.info('read from storage :) | key: $key | value: $value');
    if (value == null || value.isEmpty) {
      return [];
    }
    // final List<String> result = List<String>.from(json.decode(value) as List<dynamic>);

    final List<String> result = (json.decode(value) as List).map((item) => item as String).toList();

    // If keyword != null => search all result contain keyword
    if (keyword != null && keyword.isNotEmpty) {
      result.retainWhere((item) => item.contains(keyword));
    }

    return result;
  }

  @override
  Future<void> deleteRecentSearchItem({
    required String keyword,
  }) async {
    if (keyword.isNotEmpty) {
      final list = await readRecentSearches(key: 'RECENT_SEARCHES');
      if (list.contains(keyword)) {
        list.remove(keyword);
      }
      await saveRecentSearch(recentSearchesHistory: list);
    }
  }
}
