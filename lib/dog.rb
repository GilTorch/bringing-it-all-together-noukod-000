class Dog

  attr_accessor :name,:breed
  attr_reader :id

  def initialize(breed:nil,name:nil,id:nil)
    @name=name
    @breed=breed
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF EXISTS dogs(id INTEGER PRIMARY KEY,name TEXT,breed TEXT)")
  end

end
