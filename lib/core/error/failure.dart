abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class CancelFailure extends Failure {}

class ConnectTimeOutFailure extends Failure {}

class DioOtherFailure extends Failure {}

class ReceiveTimeOutFailure extends Failure {}

class SendTimeOutFailure extends Failure {}

class BadRequestFailure extends Failure {}

class NotFoundFailure extends Failure {}

class SomethingWentWrongFailure extends Failure {}
