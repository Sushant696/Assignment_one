abstract class BankAccount {
  String _accountNumber;
  String _accountHolderName;
  double _balance;

  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  double get balance => _balance;
  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;

  set accountNumber(String value) => _accountNumber = value;
  set accountHolderName(String value) => _accountHolderName = value;
  set balance(double value) => _balance = value;

  void deposit(double amount);
  void withdraw(double amount);

  void displayAccountInfo() {
    print('Account: $_accountNumber');
    print('Holder: $_accountHolderName');
    print('Balance: \$$_balance');
  }
}
