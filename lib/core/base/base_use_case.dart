abstract class BaseUseCase<Type> {
  Future<Type> execute();
}
