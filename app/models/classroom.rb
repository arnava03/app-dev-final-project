# == Schema Information
#
# Table name: classrooms
#
#  id             :integer          not null, primary key
#  meetings_count :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  building_id    :integer
#
class Classroom < ApplicationRecord
  belongs_to :building, required: true, class_name: "Building", foreign_key: "building_id", counter_cache: true
  has_many  :meetings, class_name: "Meeting", foreign_key: "classroom_id", dependent: :destroy
end
