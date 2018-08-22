class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
  end

  def self.save (id, name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",id, name, type)
  end
end
