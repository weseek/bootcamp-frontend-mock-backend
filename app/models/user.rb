# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id, dependent: :restrict_with_error

  validates :name, presence: true
  validates :username, uniqueness: true, allow_nil: true
end
