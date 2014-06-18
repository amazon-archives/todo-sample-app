class Task < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
