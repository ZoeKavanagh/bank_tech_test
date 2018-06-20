# frozen_string_literal: true

class TransactionHistory

attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end

  def add_credit(amount, date, balance)
    @transaction_log << { debit: ' ', credit: sprintf('%.2f', amount), date: date, balance: sprintf('%.2f',balance) }
  end

  def add_debit(amount, date, balance)
    @transaction_log << { debit: sprintf('%.2f',amount), credit: ' ', date: date, balance: sprintf('%.2f',balance) }
  end
end
