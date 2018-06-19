# frozen_string_literal: true

class TransactionHistory
  attr_reader :transaction_log, :add_credit, :date, :balance, :credit, :debit

  def initialize
    @transaction_log = []
  end

  def add_credit(amount, date = DateTime.now.strftime('%d-%m-%Y'), balance)
    @transaction_log << { debit: ' ', credit: amount, date: date, balance: balance }
  end

  def add_debit(amount, date = DateTime.now.strftime('%d-%m-%Y'), balance)
    @transaction_log << { debit: amount, credit: ' ', date: date, balance: balance }
  end
end
