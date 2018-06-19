require 'transaction_history'

describe TransactionHistory do
  let(:transaction_history) { TransactionHistory.new }
  let(:new_account) { BankAccount.new }

  describe '#initialize' do
    it 'should initialise with an empty #transaction_log array' do
      expect(transaction_history.transaction_log).to be_empty
    end
  end

  describe '#add_to_log' do
    it 'should add transaction amount when money is deposited' do
      new_account.deposit(2000)
      expect(transaction_history.transaction_log).to include(:balance)
    end
  end
end
