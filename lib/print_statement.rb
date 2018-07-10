# frozen_string_literal: true

class PrintStatement

  def print_statement(transaction_log)
    print "Date    || Credit || Debit || balance\n"
    transaction_log.each do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end
end
