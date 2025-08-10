import 'package:hive/hive.dart';
import 'dart:convert';
import '../models/repo_dto.dart';


// Local data source useing hive database
abstract class GithubLocalDataSource {
  Future<void> cache(String key, List<RepoDto> repos);
  Future<List<RepoDto>?> read(String key);
}

class GithubLocalDataSourceImpl implements GithubLocalDataSource {
  static const _boxName = 'repo_cache';
  Future<Box<String>> _box() async => await Hive.openBox<String>(_boxName);

  @override
  Future<void> cache(String key, List<RepoDto> repos) async {
    final box = await _box();
    final payload = jsonEncode(repos.map((e)=>e.toJson()).toList());
    await box.put(key, payload);
  }

  @override
  Future<List<RepoDto>?> read(String key) async {
    final box = await _box();
    final raw = box.get(key);
    if (raw == null) return null;
    final list = (jsonDecode(raw) as List).cast<Map<String,dynamic>>();
    return list.map(RepoDto.fromJson).toList();
  }
}