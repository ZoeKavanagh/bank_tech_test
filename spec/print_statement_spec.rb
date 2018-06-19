require 'print_statement'

describe PrintStatement do
  let(:pint_statement) { PrintStatement.new(statment)}
  let(:transaction_log) { { :debit => " ", :credit => amount, :date => date, :balance => balance } }

  it 'should receive the transaction_log on #initialize' do
    expect(PrintStatement.new).to_receive (:transaction_log)
  end
end
