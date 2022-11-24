abstract class BaseDB<T> {
  Future<int> insert(T values);
  Future<int> delete();
  Future<int> update();
}
