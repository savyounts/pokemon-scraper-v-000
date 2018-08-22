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
    name = db.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id = ?", id)
    type = db.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id = ?", id)
    self.new(id, name, type, db)
  end
end
