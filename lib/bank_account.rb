class BankAccount

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    attr_accessor :balance, :status
    attr_reader :name

    def deposit(amount)
        self.balance=(self.balance + amount)
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end


end
