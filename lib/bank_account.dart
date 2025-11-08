abstract class BankAccount {
  String _accountNumber;
  String _accountHolderName;
  double _balance;

  final List<String> _transactionHistory = [];

  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  double get balance => _balance;
  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;

  set accountNumber(String value) => _accountNumber = value;
  set accountHolderName(String value) => _accountHolderName = value;
  set balance(double value) => _balance = value;

  void deposit(double amount);
  void withdraw(double amount);

  void recordTransaction(String message) {
    _transactionHistory.add('${DateTime.now()} - $message');
  }

  void showTransactionHistory() {
    print('\nTransaction history for $_accountNumber:');
    if (_transactionHistory.isEmpty) {
      print('No transactions yet.');
    } else {
      for (var tx in _transactionHistory) {
        print('- $tx');
      }
    }
  }

  void displayAccountInfo() {
    print('Account: $_accountNumber');
    print('Holder: $_accountHolderName');
    print('Balance: \$$_balance');
  }

  void applyInterest() {}
}
