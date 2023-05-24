# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string           not null
#  status      :string           default("new"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assignee_id :integer
#  swimlane_id :integer          not null
#
# Indexes
#
#  index_tasks_on_assignee_id  (assignee_id)
#  index_tasks_on_swimlane_id  (swimlane_id)
#
# Foreign Keys
#
#  assignee_id  (assignee_id => users.id)
#  swimlane_id  (swimlane_id => swimlanes.id)
#
class Task < ApplicationRecord
  belongs_to :swimlane
  belongs_to :assignee, class_name: 'User', optional: true

  validates :status, inclusion: { in: ['new', 'in progress', 'resolved', 'feedback', 'rejected'] }
  validates :name, presence: true
  validates :assignee, presence: true, if: -> { assignee_id.present? }
end
