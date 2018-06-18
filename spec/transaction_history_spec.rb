require 'transaction_history'

describe TransactionHistory do
  let(:transaction_history) { TransactionHistory.new }
  describe '#initialize' do
    it 'should initialize with an empty log array' do
      expect(transaction_history.log).to eq []
    end
  end
end
