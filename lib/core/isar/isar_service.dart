// ignore_for_file: strict_raw_type

import 'package:batal/core/extension_types/string_id.dart';
import 'package:batal/core/isar/cache_model.dart';
import 'package:isar/isar.dart';

abstract base class IsarService {
  final Isar _isar;
  const IsarService._(this._isar);

  Future<IsarService> open(List<CollectionSchema<dynamic>> schemas);

  // Usefull to access it for custom queries.
  Isar get instance => _isar;

  Future<int> put<T extends CacheModel>(T object) async {
    return _isar.writeTxn(() => _isar.collection<T>().put(object));
  }

  int putSync<T extends CacheModel>(T object) {
    return _isar.writeTxnSync(() => _isar.collection<T>().putSync(object));
  }

  Future<List<int>> putAll<T extends CacheModel>(Iterable<T> objects) async {
    return _isar.writeTxn(() => _isar.collection<T>().putAll(objects.toList()));
  }

  Future<T?> get<T extends CacheModel>(String id) async {
    return _isar.txn(() => _isar.collection<T>().get(StringID.toIntID(id)));
  }

  T? getSync<T extends CacheModel>(String id) {
    return _isar.txnSync(() => _isar.collection<T>().getSync(StringID.toIntID(id)));
  }

  Future<T?> getFirst<T extends CacheModel>() async {
    return _isar.txn(() => _isar.collection<T>().where().findFirst());
  }

  T? getFirstSync<T extends CacheModel>() {
    return _isar.txnSync(() => _isar.collection<T>().where().findFirstSync());
  }

  Future<List<T>> getAll<T extends CacheModel>() async {
    return _isar.txn(() => _isar.collection<T>().where().findAll());
  }

  List<T> getAlSync<T extends CacheModel>() {
    return _isar.txnSync(() => _isar.collection<T>().where().findAllSync());
  }

  Future<bool> delete<T extends CacheModel>(T object) async {
    return _isar.writeTxn(() => _isar.collection<T>().delete(object.cacheID));
  }

  Future<bool> deleteByID<T extends CacheModel>(String id) async {
    return _isar.writeTxn(() => _isar.collection<T>().delete(StringID.toIntID(id)));
  }

  bool deleteSync<T extends CacheModel>(T object) {
    return _isar.writeTxnSync(() => _isar.collection<T>().deleteSync(object.cacheID));
  }

  Future<int> deleteAllByIDs<T extends CacheModel>(Iterable<String> ids) async {
    return _isar.writeTxn(
      () => _isar.collection<T>().deleteAll(ids.map(StringID.toIntID).toList()),
    );
  }

  Future<int> deleteAllByIDsSync<T extends CacheModel>(Iterable<String> ids) async {
    return _isar.writeTxnSync(
      () => _isar.collection<T>().deleteAllSync(ids.map(StringID.toIntID).toList()),
    );
  }

  Future<void> clear<T extends CacheModel>() async {
    return _isar.writeTxn(() => _isar.collection<T>().clear());
  }

  void clearSync<T extends CacheModel>() {
    return _isar.writeTxnSync(() => _isar.collection<T>().clearSync());
  }

  Future<List<T>> getAllByIDs<T extends CacheModel>(List<String> ids) async {
    return _isar.txn(() async {
      final docs = await _isar.collection<T>().getAll(ids.map(StringID.toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }

  List<T> getAllByIDsSync<T extends CacheModel>(List<String> ids) {
    return _isar.txnSync(() {
      final docs = _isar.collection<T>().getAllSync(ids.map(StringID.toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }

  Stream<T?> watchObject<T extends CacheModel>(String id) =>
      _isar.collection<T>().watchObject(StringID.toIntID(id));
}
