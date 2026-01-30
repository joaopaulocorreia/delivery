module App
  class Company < ApplicationRecord
    validates :company, presence: true
  end
end
