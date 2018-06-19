# frozen_string_literal: true

require 'date'
require_relative 'transaction_history'
require_relative 'print_statement'

class BankAccount
  MINIMUM_BALANCE = 0

  attr_reader :balance, :date, :amount, :transaction_log, :add_credit, :print_statement

  def initialize(transaction_log = TransactionHistory)
    @balance = 0
    @transaction_log = transaction_log.new
  end

  def deposit(amount, date=DateTime.now.strftime('%d-%m-%Y'))
    raise 'Cannot deposit a negative value' if amount <= MINIMUM_BALANCE
    @balance += amount
    @transaction_log.add_credit(amount, date, @balance)
  end

  def withdraw(amount, date=DateTime.now.strftime('%d-%m-%Y'))
    raise 'Cannot withdraw funds no funds in account' if balance <= MINIMUM_BALANCE
    raise 'Cannot withdraw a negative value' if amount <= MINIMUM_BALANCE
    @balance -= amount
    @transaction_log.add_debit(amount, date, @balance)
  end

  def print_bank_statement(statement = PrintStatement.new(@transaction_log.transaction_log))
    @statement = statement
    @statement.print_statement
  end
end
