require 'bank_account'
require 'transaction_history'

describe BankAccount do
  let(:new_account) { BankAccount.new(transaction_history) }
  let(:transaction_history) { spy :transaction_history }

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

  describe '#print_statement' do
    it 'should '
  end
end
