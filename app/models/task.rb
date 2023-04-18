class Task < ApplicationRecord
  belongs_to :swimlane
  belongs_to :assignee, class_name: 'User', optional: true

  validates :status, inclusion: { in: ['new', 'in progress', 'resolved', 'feedback', 'rejected'] }
end
