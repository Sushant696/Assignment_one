import 'bank_account.dart';

class Bank {
  final List<BankAccount> _accounts = [];

  void createAccount(BankAccount account) {
    _accounts.add(account);
    print(
      'Account ${account.accountNumber} created for ${account.accountHolderName}.',
    );
  }

  BankAccount? findAccount(String accountNumber) {
    try {
      return _accounts.firstWhere((acc) => acc.accountNumber == accountNumber);
    } catch (e) {
      print('Account not found.');
      return null;
    }
  }

  void transfer(
    String fromAccountNumber,
    String toAccountNumber,
    double amount,
  ) {
    var fromAccount = findAccount(fromAccountNumber);
    var toAccount = findAccount(toAccountNumber);

    if (fromAccount == null || toAccount == null) {
      print('Transfer failed: One or both accounts not found.');
      return;
    }

    fromAccount.withdraw(amount);
    toAccount.deposit(amount);

    print(
      'Transferred \$${amount.toStringAsFixed(2)} from ${fromAccount.accountNumber} to ${toAccount.accountNumber}.',
    );
  }

  void generateReport() {
    print('\n--- Bank Accounts Report ---');
    for (var account in _accounts) {
      account.displayAccountInfo();
      print('---------------------------');
    }
  }
}
