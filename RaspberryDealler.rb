class Raspberry
  @@states=['nothing', 'flower', 'green', 'red']

  protected
  def initialize(index)
     @index = index
     @state = 0
  end

  public
  def grow!
    @state=(@state+1)%4
  end

  def ripe?
    @@states[@state]=='red'
  end

end





class RaspberryBush
  def initialize (amount)
    @berries = Array.new(amount)
    for i in (0...amount)
      @berries[i] = Raspberry.new(i)
    end
  end

  def grow_all!
    @berries.each(&:grow!)
  end

  def ripe_all?
    @berries.all?(&:ripe?)
  end

  def give_away_all!
    @berries=nil
  end
end




class Human
  attr_accessor :name ,:plant


  protected
  @plant = RaspberryBush

  public

  def initialize(name)
    @name = name
  end

  def work!
    plant.grow_all!
    p 'working'
  end

  def harvest
    if plant.ripe_all?
      plant.give_away_all!
      "Harevsted"
      true
    else
      p "The plant isn't ready"
      false
    end
  end

  def self.knowledge_base
    p "Our galaxy's taste is like raspberry's taste."
  end

end

if __FILE__ == "RaspberryDealler.rb"
  Human.knowledge_base
  bush = RaspberryBush.new(10)
  man = Human.new('Jack')
  man.plant=bush
  man.work!
  man.harvest
  until man.harvest
    man.work!
  end
end
