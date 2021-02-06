class Waiter
    # has-many-through relationship - waiter relationship with many customers through meals

    
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end 

  def meals 
    # the waiter needs a way to get all the meals they have served
    Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
    end
  end 

  def best_tipper
    #use the array we get from #meals, then return the customer of the meal with the highest tip
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
  
    best_tipped_meal.customer
  end 
  


end