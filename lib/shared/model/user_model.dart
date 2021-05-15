class User {
  int _id;
  String _name;
  String _address;
  String _city;
  int _phone;
  String _birthDate;

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

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'address': _address,
      'city': _city,
      'phone': _phone,
      'birth_date': _birthDate
    };
  }

  @override
  String toString() {
    return "Nome: ${_name}, Endereco: ${_address}, Cidade: ${_city}, Telefone: ${_phone}, Nascimento: ${_birthDate}";
  }
}
