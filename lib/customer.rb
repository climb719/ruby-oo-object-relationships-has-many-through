class Customer
    attr_accessor :name, :age # the customer can change their name or age

    @@all = []
  
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self # class variable that tracks every instance of customer upon creation
    end
  
    def self.all
      @@all 
    end

    def new_meal(waiter, total, tip=0) # take in an instance of a waiter and supply the total and tip
        Meal.new(waiter, self, total, tip) # don't need to take customer in as an argument, because we're passing in self as a reference to the current instance of customer
    end                                   # ...automatically associate each new meal with the customer 
    
    def meals
        # iterating through every instance of Meal and returning only 
        #the ones where the meal's customer matches the current customer instance
        Meal.all.select do |meal|
          meal.customer == self
        end
    end
    
    def waiters
        meals.map do |meal| # take array of all of customer instance meals and map over it
          meal.waiter # get the waiter from each of those meals
        end
    end 

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end
    
      def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
      end
    
      def self.oldest_customer
        oldest_age = 0
        oldest_customer = nil
        self.all.each do |customer|
          if customer.age > oldest_age
            oldest_age = customer.age
            oldest_customer = customer
          end
        end
        oldest_customer
      end

end
    
    # goal of establishing a has-many-through relationship
    #need a way for our customer and waiter instances to get 
    #information about each other. The only way they can get that 
    #information is through the meals they've created
 