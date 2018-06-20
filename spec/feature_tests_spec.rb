require './lib/bank_account'

describe 'Bank Account' do
  it 'should print to the console my transactions' do
    my_account = BankAccount.new

    my_account.deposit(1000.00, '10/01/2012')
    my_account.deposit(2000.00, '13/01/2012')
    my_account.withdraw(500.00, '14/01/2012')

    expect { my_account.print_bank_statement }.to output("Date    || Credit || Debit || balance\n14/01/2012 ||   || 500.00 || 2500.00\n13/01/2012 || 2000.00 ||   || 3000.00\n10/01/2012 || 1000.00 ||   || 1000.00\n").to_stdout
  end
end
