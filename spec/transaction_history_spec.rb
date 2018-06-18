require 'transaction_history'

describe TransactionHistory do
  let(:transaction_history) { TransactionHistory.new }
  describe '#log' do
    it 'should be a hash' do
      expect(transaction_history.log).to eq {}
    end
  end
end
