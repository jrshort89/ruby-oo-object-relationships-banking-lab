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

  def execute_transaction
    if self.status == "pending" && self.sender.balance >= self.amount && self.sender.status == "open"
      self.sender.deposit(-self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    binding.pry
    end
  
  
end
