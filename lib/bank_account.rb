class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    def initialize(name)
        @name = name 
        @balance = 1000
        @status = "open"
    end 

    def deposit(add_money)
        self.balance = add_money + @balance
    end 

    def display_balance
        "Your balance is $#{self.balance}."
    end 

    def valid?
        if self.balance > 0 && @status == "open"
            true 
        else 
            false 
        end 
    end 

    def close_account 
        self.status = "closed"
    end 

end
