require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver 
  attr_accessor :amount, :status
  
  def initialize(sender,receiver,amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    #binding.pry
  end

  def valid?
       @sender.valid? && @receiver.valid? ? true : false  
  end
  
  def execute_transaction
    if valid? && @sender.balance > amount
      @receiver.balance += amount
      @sender.balance -= amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."    
    end 
  end
    #binding.pry
    def reverse_transfer
      if execute_transaction
        @receiver.balance -= amount
        @sender.balance += amount
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end
end
