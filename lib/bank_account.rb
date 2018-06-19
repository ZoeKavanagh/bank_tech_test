require 'date'
require_relative 'transaction_history'

class BankAccount
  attr_reader :balance, :date, :amount, :transaction_log, :add_credit

  def initialize
    @balance = 0
    @transaction_log = TransactionHistory.new
  end

  def deposit(amount, date=DateTime.now.strftime("%d-%m-%Y"))
    @balance += amount
    @transaction_log.add_credit(amount, date, @balance)
  end

  def withdrawl(amount)
    @balance -= amount
  end

end
