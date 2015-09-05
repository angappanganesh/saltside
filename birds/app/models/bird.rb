class Bird
  include MongoMapper::Document

  validates :name, :family, :continents, presence: true
  validates :continents, length: {minimum: 1}

  key :name, String
  key :family, String
  key :continents, Array
  key :added, String, default: Time.now.utc.strftime('%Y-%m-%d')
  key :visible, Boolean, default: false
end