### Bank Account Tech Test

#### What is the problem that needs solving?

You should be able to interact with the code via a REPL, for example IRB. (There is no requirement to implement a command line interface that takes input from STDIN.)

You should be able to deposit cash amounts to your bank account and withdraw amounts from your account.

You should also be able to print your account statement, which includes the date, type of transaction (credit or debit), the amount transacted and the balance following each transaction.  Transaction should be printed to with the latest transaction at the top.

Data can be kept in memory (it doesn't need to be stored to a database or anything).

Your statement will be printed to the console as per the below format:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
#### How did I approach designing my solution?

I took a TDD approach to meeting the above requirements - this means that I started by writing tests before building my code.

I also took an Object Orientated approach to the design of my app.  I identified the three core functionalities that were required: Logging the transactions, maintaining the balance with 'withdraw/deposit' capabilities, printing the statement to the console.  

Whilst taking a TDD approach, I also created a test version of the app, which allowed me to test various ways of creating a solution before implementing the code.

#### How I structured my code and why

Based on the SOLID principles, it was clear that my app would be consist of at least three classes each with their single responsibility.  The BankAccount class was the mothership, calling on the PrintStatement class and TransactionHistory class.

By structuring my code this way, if in future any changes need to be made to how transactions were logged or how the statement would print, these could amended easily without breaking the rest of my code.  I also tried to keep my methods as short as possible.

#### How to install my code and tests

Firstly, clone my repo. Then run the following commands in your command line:
~~~
bundle install
irb
require './spec/bank_account'
> my_account = BankAccount.new
> my_account.deposit(500)
> my_account.withdraw(200)
> my_account.print_bank_statement
~~~
You should get something like this . .
![Alt text](./images/irb.png)

#### Testing

Through my TDD approach to building this Bank Account, I managed to achieve 100% text coverage from the start and was able to maintain high coverage for the continuation of my build.

![Alt text](./images/testcoverage.png)
