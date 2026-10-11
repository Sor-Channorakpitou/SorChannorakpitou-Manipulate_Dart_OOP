class BankAccount {
    // TODO
    final String _username; 
    final int _accountNumber;
    double _balance = 0;

    BankAccount(this._username, this._accountNumber);
    
    double balance() {
      return _balance;
    }

    void withdraw(double amount) {
      amount <= _balance ? _balance -= amount : throw Exception("Insufficient balance.");
    }

    void credit(double amount) {
      _balance += amount;
    }
}

class Bank {
  // TODO
  final String _name;
  final List<BankAccount> _bankAccounts = [];
  final int _bankCode;

  Bank(this._bankCode, this._name);

  BankAccount createAccount(int accountId, String accountOwner) {
    for(var account in _bankAccounts) {
      if(account._accountNumber == accountId) {
        throw Exception("Account with ID $accountId already exists!");
      }
    }

    BankAccount newAccount = BankAccount(accountOwner, accountId);
    _bankAccounts.add(newAccount);

    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(1, "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
