abstract class UseCase<R, P extends Params> {
  Future<R> perform(P params);
}

abstract class Params {}

abstract class UseCaseNoParam<R> {
  Future<R> perform();
}
