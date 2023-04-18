class Swimlane < ApplicationRecord
  belongs_to :sprint, optional: true
end
