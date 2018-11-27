class Dog

  attr_accessor :name,:breed
  attr_reader :id

  def initialize(breed:nil,name:nil,id:nil)
    @name=name
    @breed=breed
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

end
