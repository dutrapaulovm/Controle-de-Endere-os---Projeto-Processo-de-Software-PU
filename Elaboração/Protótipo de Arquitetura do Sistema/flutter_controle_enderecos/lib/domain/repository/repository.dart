abstract class Repository<T> {
  Future<int> insert(T entity);
  Future<int> delete(T entity);
  Future<int> update(T entity);
  Future<T?> findById(T entity);
  Future<List<T>> findAll(T entity);
}
