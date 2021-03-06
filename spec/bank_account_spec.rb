# frozen_string_literal: true

require 'bank_account'


describe BankAccount do
  let(:new_account) { BankAccount.new(transaction_history, printer) }
  let(:transaction_history) { spy :transaction_history, transaction_log: transaction_log }
  let(:printer) { double :printer, print_statement: "Date    || Credit || Debit || balance\n19-06-2018 || 2000 ||   || 4000\n" }
  let(:transaction_log) { [{ debit: ' ', credit: 2000, date: '19-06-2018', balance: 4000 }] }

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
      new_account.deposit(4000)
      expect(transaction_history).to have_received(:add_credit)
    end

    it 'should raise and error if user tries to deposit a negative value' do
      expect { new_account.deposit(-300) }.to raise_error('Cannot deposit a negative value')
    end
  end

  describe '#withdraw' do
    it 'should reduce the correct ammount from account balance' do
      new_account.deposit(2000)
      new_account.withdraw(500)
      expect(new_account.balance).to eq 1500
    end

    it 'should raise an error if user tries to withdraw from balance of 0' do
      expect { new_account.withdraw(500) }.to raise_error('Cannot withdraw funds no funds in account')
    end

    it 'should raise an error if user tries to withdraw a negative value' do
      new_account.deposit(500)
      expect { new_account.withdraw(-300) }.to raise_error('Cannot withdraw a negative value')
    end

    it 'should add details of withdrawl transaction to transaction log' do
      new_account.deposit(1000)
      new_account.withdraw(500)
      expect(transaction_history).to have_received(:add_debit)
    end
  end

  describe '#print_bank_statement' do
    it 'should print the statement to the console' do
      expect(new_account.print_bank_statement).to eq("Date    || Credit || Debit || balance\n19-06-2018 || 2000 ||   || 4000\n")
    end
  end
end
