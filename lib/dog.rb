require 'pry'

class Dog

  attr_accessor :name,:breed
  attr_reader :id

  def initialize(breed:nil,name:nil,id:nil)
    @name=name
    @breed=breed
    @id=id
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY,name TEXT,breed TEXT)")
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end

  def save
    sql=<<-SQL
      INSERT INTO dogs(name,breed)
      VALUES(?,?)
    SQL

    DB[:conn].execute(sql,self.name,self.breed)
    @id=DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end

  def self.create(hash)
    dog=Dog.new(hash)
    dog.save
  end

  def self.find_by_id(id)
    sql=<<-SQL
      SELECT * FROM dogs
      WHERE id=?
    SQL
    row=DB[:conn].execute(sql,id)
    #binding.pry
    dog=Dog.new(id:row[0][0],name:row[0][1],breed:row[0][2])
    #binding.pry
  end

  def self.find_or_create_by(name:nil,breed:nil) 
  end

end
