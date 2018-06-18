require 'bank_account'

describe BankAccount do
  let(:new_account) { BankAccount.new }

  it { is_expected.to respond_to :balance }

  describe '#balance' do
    it 'should display the current balance' do
      expect(new_account.balance).to eq 0
    end
  end
end
