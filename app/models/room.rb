class Room < ApplicationRecord
  has_many :messages

  def to_param
    short_code
  end


  def short_code
    Base62.encode(self.id)
  end

end
