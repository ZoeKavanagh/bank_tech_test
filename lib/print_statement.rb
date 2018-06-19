class PrintStatement

  attr_reader :transaction_log, :print_statement

  def initialize(transaction_log)
    @statement = transaction_log
  end

  def print_statement
    spacing = 10
      print "Date    || Credit || Debit || balance\n"
    @statement.each do |transaction|
      print "#{transaction[:date]} "
      print  "|| #{transaction[:credit]} "
      print "|| #{transaction[:debit]} "
      print "|| #{transaction[:balance]}\n"
    end
  end
end
