require 'pry'
require_relative './bank_account.rb'

@@transfers = []

class Transfer
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@transfers << self
  end

  attr_reader :sender
  attr_accessor :receiver, :status, :amount

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance >= self.amount && self.valid?
      self.sender.deposit(-self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.rejected
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = "reversed"
    end
  end
end
