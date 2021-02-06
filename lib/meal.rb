class Meal
    #single source of truth- 
    #tell the Meal class to know all the details of each meal instance -cost, tip (which defaults to 0), and who customer and waiter were for each meal
    #going to give both the customer and waiter instances the ability to get all the information about the meal that they need without having to store it themselve
    attr_accessor :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer 
    @total = total 
    @tip = tip
    @@all << self
  end

  def self.all
    @@all
  end

end