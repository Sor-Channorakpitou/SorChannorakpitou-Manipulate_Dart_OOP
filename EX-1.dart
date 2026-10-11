enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;


  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  Employee.mobileDeveloper(this._name, this._baseSalary, this._address, this._yearsOfExperience): _skills = const [Skill.DART, Skill.FLUTTER];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary + _yearsOfExperience * 50;

    for (Skill skill in _skills) {
      switch (skill) {
        case.FLUTTER:
          salary += 100;
          break;
        case.DART:
          salary += 50;
          break;
        case.OTHER:
          salary += 20;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 400, [Skill.OTHER], const Address('New TK', 'Ta Khmau', '23491'), 2);
  emp1.printDetails();
  print(emp1.computeSalary());

  var emp2 = Employee('Ronan', 450, [Skill.DART], const Address('Old TK', 'Ta Khmau', '23490'), 1);
  emp2.printDetails();
  print(emp2.computeSalary());
}