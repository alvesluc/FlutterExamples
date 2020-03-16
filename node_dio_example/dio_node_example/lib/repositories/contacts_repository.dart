import 'package:dio_node_example/model/contact.dart';
import 'package:dio_node_example/utils/custom_dio.dart';

class ContactsRepository {
  Future<List<ContactModel>> findAll() {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get('http://192.168.1.4:3000/contacts').then((res) {
      return res.data.map<ContactModel>((c) => ContactModel.fromMap(c)).toList()
          as List<ContactModel>;
    }).catchError((err) => print(err));
  }

  Future<List<ContactModel>> findFilter(String name) {
    var dio = CustomDio.withAuthentication().instance;
    return dio
        .get('http://192.168.1.4:3000/contacts/filter?name=$name')
        .then((res) {
      return res.data.map<ContactModel>((c) => ContactModel.fromMap(c)).toList()
          as List<ContactModel>;
    });
  }
}
