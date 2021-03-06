# frozen_string_literal: true

require 'date'
require_relative 'transaction_history'
require_relative 'print_statement'

class NegativeDepositError < StandardError; end

class NegativeFundsError < StandardError; end

class NegativeWithdrawError< StandardError; end

class BankAccount
  MINIMUM_BALANCE = 0
  MINIMUM_VALUE = 0
  TODAYS_DATE = DateTime.now.strftime('%d-%m-%Y')

  attr_reader :balance

  def initialize(transaction_log=TransactionHistory.new, printer=PrintStatement.new)
    @balance = 0
    @transaction_log = transaction_log
    @printer = printer
  end

  def deposit(amount, date=TODAYS_DATE)
    raise NegativeDepositError, 'Cannot deposit a negative value' if amount <= MINIMUM_VALUE
    @balance += amount
    @transaction_log.add_credit(amount, date, @balance)
  end

  def withdraw(amount, date=TODAYS_DATE)
    raise NegativeFundsError, 'Cannot withdraw funds no funds in account' if balance <= MINIMUM_BALANCE || amount > balance 
    raise NegativeWithdrawError, 'Cannot withdraw a negative value' if amount <= MINIMUM_VALUE
    @balance -= amount
    @transaction_log.add_debit(amount, date, @balance)
  end

  def print_bank_statement
    statement = @transaction_log.get_transactions
    @printer.print_statement(statement)
  end
end
