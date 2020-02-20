import 'package:mobx/mobx.dart';
import 'package:mobx_test/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCPF() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.name.length < 3) {
      return "Seu nome precisa ter mais de 3 caracteres";
    }
    return null;
  }

  String validateCPF() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.cpf.length < 10) {
      return "O número do CPF possui 11 digitos";
    }
    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!client.email.contains("@")) {
      return "Este não é um email válido";
    }
    return null;
  }

  dispose() {}
}
