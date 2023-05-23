# == Schema Information
#
# Table name: sprints
#
#  id          :integer          not null, primary key
#  end_at      :date             not null
#  is_archived :boolean          default(FALSE), not null
#  name        :string           not null
#  start_at    :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sprint < ApplicationRecord
  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
