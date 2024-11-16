module Product
  module Todo
    class Task < ApplicationRecord
      belongs_to :user
    end
  end
end
