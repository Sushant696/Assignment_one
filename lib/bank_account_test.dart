import 'package:dart_assignment/bank.dart';
import 'package:dart_assignment/interest_bearing.dart';
import 'package:dart_assignment/bank_account.dart';

class SavingsAccount extends BankAccount implements InterestBearing {
  int _withdrawalCount = 0;

  SavingsAccount(super.accountNumber, super.accountHolderName, super.balance);

  @override
  void deposit(double amount) {
    balance += amount;
    recordTransaction('Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  void withdraw(double amount) {
    if (_withdrawalCount >= 3) {
      print('Withdrawal limit reached');
      return;
    }
    if (balance - amount < 500) {
      print('Minimum balance \$500 required');
      return;
    }
    balance -= amount;
    _withdrawalCount++;
    recordTransaction('Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  double calculateInterest() => balance * 0.02;

  @override
  void applyInterest() {
    final interest = calculateInterest();
    balance += interest;
    print(
      'Interest of \$${interest.toStringAsFixed(2)} added to savings account.',
    );
  }
}

class PremiumAccount extends BankAccount implements InterestBearing {
  PremiumAccount(super.accountNumber, super.accountHolderName, super.balance);

  @override
  void deposit(double amount) {
    balance += amount;
    recordTransaction('Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < 10000) {
      print('Minimum balance \$10000 required');
      return;
    }
    balance -= amount;
    recordTransaction('Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  double calculateInterest() {
    return balance * 0.05;
  }

  @override
  void applyInterest() {
    final interest = calculateInterest();
    balance += interest;
    print(
      'Interest of \$${interest.toStringAsFixed(2)} added to savings account.',
    );
  }
}

class CheckingAccount extends BankAccount {
  CheckingAccount(super.accountNumber, super.accountHolderName, super.balance);

  @override
  void deposit(double amount) {
    balance += amount;
  }

  @override
  void withdraw(double amount) {
    balance -= amount;
    recordTransaction('Withdrew \$${amount.toStringAsFixed(2)}');

    if (balance < 0) {
      balance -= 35;
      recordTransaction('Overdraft fee of \$35 applied');
      print(
        'Warning: Overdraft fee applied. Your balance is now \$${balance.toStringAsFixed(2)}',
      );
    }
  }
}

class StudentAccount extends BankAccount {
  StudentAccount(super.accountNumber, super.accountHolderName, super.balance);

  @override
  void deposit(double amount) {
    if (balance + amount > 5000) {
      print('Cannot exceed maximum balance of \$5000.');
      return;
    }
    balance += amount;
    recordTransaction('Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < 0) {
      print('Insufficient funds.');
      return;
    }
    balance -= amount;
    recordTransaction('Withdrew \$${amount.toStringAsFixed(2)}');
  }
}

void main() {
  var bank = Bank();

  var savings = SavingsAccount('SAV001', 'John', 1000);
  var checking = CheckingAccount('CHK001', 'Jane', 500);
  var premium = PremiumAccount('PREM001', 'Bob', 15000);

  bank.createAccount(savings);
  bank.createAccount(checking);
  bank.createAccount(premium);

  bank.transfer('SAV001', 'CHK001', 200);

  savings.applyInterest();
  premium.applyInterest();

  bank.generateReport();
}
