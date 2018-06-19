require 'date'
require_relative 'transaction_history'

class BankAccount
  attr_reader :balance, :date, :amount, :transaction_log, :add_credit

  def initialize(transaction_log = TransactionHistory)
    @balance = 0
    @transaction_log = transaction_log.new
  end

  def deposit(amount, date=DateTime.now.strftime("%d-%m-%Y"))
    @balance += amount
    @transaction_log.add_credit(amount, date, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_log.add_debit(amount, date, @balance)
  end

end
