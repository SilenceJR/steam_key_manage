abstract class BaseDB<T> {
  Future<int> insert(T value);
  Future<int> delete(T value);
  Future<int> update(T value);
}
