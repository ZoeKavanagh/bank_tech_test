require 'bank_account'
require 'transaction_history'

describe BankAccount do
  let(:new_account) { BankAccount.new(transaction_history) }
  let(:transaction_history) { spy :transaction_history }
  let(:transaction_log) { [{ :debit => " ", :credit => 2000, :date => "19-06-2018", :balance => 4000 }] }
  let(:printstatement) { double :print_statement, print_statement: "Date    || Credit || Debit || balance\n19-06-2018 || 2000 ||   || 4000\n"}


  it { is_expected.to respond_to :balance }

  describe '#balance' do
    it 'should display the current balance' do
      expect(new_account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'should add the correct ammount to account balance' do
      new_account.deposit(2000)
      expect(new_account.balance).to eq 2000
    end

    it 'should add details of deposit transaction to transaction log' do
      new_account.deposit(4000, "19-06-2018")
      expect(transaction_history).to have_received(:add_credit)
    end
  end

  describe '#withdraw' do
    it 'should reduce the correct ammount from account balance' do
      new_account.deposit(2000)
      new_account.withdraw(500)
      expect(new_account.balance).to eq 1500
    end

    it 'should add details of withdrawl transaction to transaction log' do
      new_account.deposit(1000, "19-06-2018")
      new_account.withdraw(500)
      expect(transaction_history).to have_received(:add_debit)
    end
  end

  describe '#print_bank_statement' do
    it 'should take the transaction_log and print to the console' do
      expect(new_account.print_bank_statement(printstatement)).to eq("Date    || Credit || Debit || balance\n19-06-2018 || 2000 ||   || 4000\n")
    end
  end
end
