require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize (id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save (name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    binding.pry
    Pokemon.new(id:result[0], name:result[1], type:result[2], db:db)
  end
end
