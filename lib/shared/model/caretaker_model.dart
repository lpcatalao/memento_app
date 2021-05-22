const CARETAKER_ID = 'caretakerId';
const CARETAKER_NAME = 'caretakerName';
const CARETAKER_ADDRESS = 'caretakerAddress';
const CARETAKER_CITY = 'caretakerCity';
const CARETAKER_PHONE = 'caretakerPhone';

class Caretaker {
  int _id;
  String _name;
  String _address;
  String _city;
  int _phone;

  Caretaker(this._name, this._address, this._city, this._phone);

  set id(int value) {
    _id = value;
  }

  int get phone => _phone;

  String get city => _city;

  String get address => _address;

  String get name => _name;

  int get id => _id;

  Map<String, dynamic> toMap() {
    return {
      CARETAKER_ID: _id,
      CARETAKER_NAME: _name,
      CARETAKER_ADDRESS: _address,
      CARETAKER_CITY: _city,
      CARETAKER_PHONE: _phone,
    };
  }

  @override
  String toString() {
    return 'Caretaker{_id: $_id, _name: $_name, _address: $_address, _city: $_city, _phone: $_phone}';
  }
}
