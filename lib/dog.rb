class Dog

  attr_accessor :name,:breed
  attr_reader :id

  def initialize(breed:nil,name:nil,id:nil)
    @name=name
    @breed=breed
  end


end
