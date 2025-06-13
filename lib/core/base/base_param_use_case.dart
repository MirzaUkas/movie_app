abstract class BaseParamUseCase<Type, Params> {
  Future<Type> execute(Params params);
}