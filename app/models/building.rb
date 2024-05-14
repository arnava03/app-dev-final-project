# == Schema Information
#
# Table name: buildings
#
#  id               :integer          not null, primary key
#  address          :string
#  classrooms_count :integer
#  name             :string
#  xcoord           :string
#  ycoord           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Building < ApplicationRecord
  has_many  :classrooms, class_name: "Classroom", foreign_key: "building_id", dependent: :destroy
end
