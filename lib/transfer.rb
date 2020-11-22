require 'pry'
class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount, status = 'pending')
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = status 
  end 

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end

  end 
  
  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount) 
      @status = "complete"
      else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end  

    def reverse_transfer 
      if execute_transaction 
        @receiver.balance -= @amount
        @sender.deposit(@amount) 
        @status = "reversed"
      end 
    end 


 
end
