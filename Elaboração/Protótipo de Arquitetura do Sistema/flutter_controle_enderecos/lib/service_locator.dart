/// A classe `ServiceLocator` fornece um mecanismo centralizado para
///  registrar e recuperar serviços em uma aplicação.
///
/// Exemplo de uso da classe ServiceLocator:
///
/// ```dart
/// void main() {
///   // Criando uma instância do ServiceLocator
///   var locator = ServiceLocator();
///
///   // Registrando um serviço
///   locator.registerService("logger", Logger());
///
///   // Obtendo o serviço
///   var logger = locator.getService("logger");
///   logger.log("Hello, world!");
/// }
/// ```
///
/// Neste exemplo, criamos uma instância do `ServiceLocator`,
/// registramos um serviço com a chave "logger" e, em seguida,
/// recuperamos esse serviço usando `getService`. Finalmente,
/// utilizamos o serviço obtido para fazer um log de uma mensagem.
class ServiceLocator {
  /// Um mapa que mantém os serviços registrados, onde a chave é uma
  /// String representando o nome do serviço e o valor é o próprio serviço.
  final Map<String, dynamic> _services = {};

  /// Registra um serviço com a chave especificada.
  ///
  /// O parâmetro [key] é a chave única que identifica o serviço.
  ///
  /// O parâmetro [service] é o próprio serviço a ser registrado.
  void registerService(String key, dynamic service) {
    _services[key] = service;
  }

  /// Recupera o serviço associado à chave especificada.
  ///
  /// Retorna o serviço correspondente à chave [key] fornecida,
  /// ou [null] se nenhum serviço estiver registrado com essa chave.
  dynamic getService(String key) {
    return _services[key];
  }
}
