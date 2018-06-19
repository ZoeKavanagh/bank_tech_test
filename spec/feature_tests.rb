require './lib/bank_account'

my_account = BankAccount.new

my_account.deposit(1000.00)
my_account.deposit(2000.00)
my_account.withdraw(500.00)

my_account.print_bank_statement
