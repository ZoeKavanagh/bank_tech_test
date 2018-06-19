# frozen_string_literal: true

require 'transaction_history'

describe TransactionHistory do
  let(:transaction_history) { TransactionHistory.new }

  describe '#initialize' do
    it 'should initialise with an empty #transaction_log array' do
      expect(transaction_history.transaction_log).to be_empty
    end
  end

  describe '#add_credit' do
    it 'should add transaction amount when money is deposited' do
      transaction_history.add_credit(2000, '19-06-2018', 2000)
      expect(transaction_history.transaction_log[0][:credit]).to eq(2000)
    end

    it 'should add transaction date when money is deposited' do
      transaction_history.add_credit(2000, '19-06-2018', 2000)
      expect(transaction_history.transaction_log[0][:date]).to eq('19-06-2018')
    end

    it 'should add transaction balance when money is deposited' do
      transaction_history.add_credit(2000, '19-06-2018', 2000)
      expect(transaction_history.transaction_log[0][:balance]).to eq(2000)
    end
  end

  describe '#add_debit' do
    it 'should add transaction amount when money is withdrawn' do
      transaction_history.add_debit(1000, '19-06-2018', 1000)
      expect(transaction_history.transaction_log[0][:debit]).to eq(1000)
    end

    it 'should add transaction date when money is withdrawn' do
      transaction_history.add_debit(1000, '19-06-2018', 1000)
      expect(transaction_history.transaction_log[0][:date]).to eq('19-06-2018')
    end

    it 'should add transaction balance when money is deposited' do
      transaction_history.add_debit(1000, '19-06-2018', 1000)
      expect(transaction_history.transaction_log[0][:balance]).to eq(1000)
    end
  end
end
