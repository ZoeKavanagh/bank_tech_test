require 'bank_account'

describe BankAccount do
  let(:new_account) { BankAccount.new }

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
  end

  describe '#withdrawl' do
    it 'should reduce the correct ammount from account balance' do
      new_account.deposit(2000)
      new_account.withdrawl(500)
      expect(new_account.balance).to eq 1500
    end
  end
end
