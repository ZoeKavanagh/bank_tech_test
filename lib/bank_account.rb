# frozen_string_literal: true

require 'date'
require_relative 'transaction_history'
require_relative 'print_statement'

class BankAccount
  MINIMUM_BALANCE = 0
  MINIMUM_VALUE = 0
  DATE = DateTime.now.strftime('%d-%m-%Y')

  attr_reader :balance

  def initialize(transaction_log=TransactionHistory.new, printer=PrintStatement.new)
    @balance = 0
    @transaction_log = transaction_log
    @printer = printer
  end

  def deposit(amount, date=DATE)
    raise 'Cannot deposit a negative value' if amount <= MINIMUM_VALUE
    @balance += amount
    @transaction_log.add_credit(amount, date, @balance)
  end

  def withdraw(amount, date=DATE)
    raise 'Cannot withdraw funds no funds in account' if balance <= MINIMUM_BALANCE
    raise 'Cannot withdraw a negative value' if amount <= MINIMUM_VALUE
    @balance -= amount
    @transaction_log.add_debit(amount, date, @balance)
  end

  def print_bank_statement
    statement = @transaction_log.transaction_log.reverse
    @printer.print_statement(statement)
  end
end
