class DaysShip < ActiveHash::Base
  self.data = [
    {id: 1, how_many_days: '--'},
    {id: 2, how_many_days: '1~2日で発送'},
    {id: 3, how_many_days: '2~3日で発送'},
    {id: 4, how_many_days: '4~7日で発送'},
  ]

  include ActiveHash::Associations
  has_many :items
end
