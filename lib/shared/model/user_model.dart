const USER_TABLE = 'user';
const USER_ID = 'userId';
const USER_NAME = 'userName';
const USER_ADDRESS = 'userAddress';
const USER_CITY = 'userCity';
const USER_PHONE = 'userPhone';
const USER_BIRTH_DATE = 'userBirthDate';
const FK_CARETAKER_ID = 'caretakerId';

class User {
  int _id;
  String _name;
  String _address;
  String _city;
  int _phone;
  String _birthDate;
  int _caretakerId;

  User(this._name, this._address, this._city, this._phone, this._birthDate);

  set id(int value) {
    _id = value;
  }

  String get birthDate => _birthDate;

  int get phone => _phone;

  String get city => _city;

  String get address => _address;

  String get name => _name;

  int get id => _id;

  int get caretakerId => _caretakerId;

  set caretakerId(int value) {
    _caretakerId = value;
  }

  Map<String, dynamic> toMap() {
    return {
      USER_ID: _id,
      USER_NAME: _name,
      USER_ADDRESS: _address,
      USER_CITY: _city,
      USER_PHONE: _phone,
      USER_BIRTH_DATE: _birthDate,
      FK_CARETAKER_ID: _caretakerId
    };
  }

  @override
  String toString() {
    return 'User{_id: $_id, _name: $_name, _address: $_address, _city: $_city, _phone: $_phone, _birthDate: $_birthDate, _caretakerId: $_caretakerId}';
  }
}
