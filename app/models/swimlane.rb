# == Schema Information
#
# Table name: swimlanes
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sprint_id   :integer
#
# Indexes
#
#  index_swimlanes_on_sprint_id  (sprint_id)
#
# Foreign Keys
#
#  sprint_id  (sprint_id => sprints.id)
#
class Swimlane < ApplicationRecord
  belongs_to :sprint, optional: true
  has_many :tasks, dependent: :restrict_with_error

  validates :name, presence: true
  # gurantee that sprint exists, having ID: sprint_id
  validates :sprint, presence: true, if: -> { sprint_id.present? }
end
