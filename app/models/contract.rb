class Contract < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
end
