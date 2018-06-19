require 'bank_account'

class TransactionHistory

  attr_reader :transaction_log, :add_credit, :date, :balance, :credit, :debit

  def initialize
    @transaction_log = []
  end

  def add_credit(amount, date=DateTime.now.strftime("%d-%m-%Y"), balance)
    @transaction_log << { :debit => " ", :credit => amount, :date => date, :balance => balance }
  end


end
