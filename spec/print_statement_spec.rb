require 'print_statement'

describe PrintStatement do
  let(:transaction_log) { [{ :debit => " ", :credit => 2000, :date => "19-06-2018", :balance => 4000 }] }
  let(:printstatement) { PrintStatement.new(transaction_log)}

  describe '#print_statement' do
    it 'should print the transaction_log to console' do
    expect { printstatement.print_statement }.to output("Date    || Credit || Debit || balance\n19-06-2018 || 2000 ||   || 4000\n").to_stdout
    end
  end
  
end
