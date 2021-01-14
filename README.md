# Stock Market Portfolio Manager

Practising TDD while creating something that's actually useful...

# Mission

Create a simple stock market portfolio ledger on which retail traders can record buys and sells and keep track of profit and loss.
All the user should have to do is enter trade information when they open or close a position. The rest is dealt with programmatically.

This git is a continuation of this, when I started this project a couple of days ago.

# Features

Currently, users can:

- create an account
- add cash to and withdraw cash from that account
- the account will not let you spend money that isn't on the account
- the account will not let the balance fall below zero
- record the opening of a position
- record the closing of a position

# How To Use

## Account.buy

account.buy is used to record a trade. 
This method requires three arguments:

- Stock ticker
- Quantity purchased
- Book cost

This information is usually provided for you by your broker account and keeps things simple.

When a user records the purchase of stock using the buy method, the app automatically records the transaction on the transactions array and records it as a current position. The book cost of the position is also deducted from the account balance.

## Account.sell

The sell method is used to record sale of stock.
It requires the same arguments as the buy method, though instead of book cost, we require proceeds.

When a user records the sale of stock using the sell method,the app automatically records the transaction on the transactions array and removes the quantity of stock sold from the current positions. A profit and loss record for the trade will also be made on the ledger array. Proceeds will be added to the account balance.
