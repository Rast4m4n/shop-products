import 'package:shop_products/data/api/model/api_user_model.dart';
import 'package:shop_products/domain/models/user_model.dart';

abstract class UserModelMapper {
  static UserModel fromApi(ApiUserModel api) {
    return UserModel(
      name: api.name,
      surname: api.surname,
      age: api.age,
      password: api.password,
      mail: api.mail,
      phoneNumber: api.phoneNumber,
      address: api.address,
    );
  }

  static ApiUserModel fromModel(UserModel model) {
    return ApiUserModel(
      name: model.name,
      surname: model.surname,
      age: model.age,
      password: model.password,
      mail: model.mail,
      phoneNumber: model.phoneNumber,
      address: model.address,
    );
  }
}
