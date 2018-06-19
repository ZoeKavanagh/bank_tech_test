require 'bank_account'

class TransactionHistory

  attr_reader :transaction_log, :date, :balance, :credit, :debit

  def initialize
    @transaction_log = []
  end

  def add_to_log
  end


end
