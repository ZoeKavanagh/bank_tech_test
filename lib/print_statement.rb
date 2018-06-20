# frozen_string_literal: true

class PrintStatement
  attr_reader :transaction_log, :print_statement

  def initialize
  end

  def print_statement(transaction_log)
    spacing = 10
    print "Date    || Credit || Debit || balance\n"
    transaction_log.each do |transaction|
      print "#{transaction[:date]} "
      print "|| #{transaction[:credit]} "
      print "|| #{transaction[:debit]} "
      print "|| #{transaction[:balance]}\n"
    end
  end
end
