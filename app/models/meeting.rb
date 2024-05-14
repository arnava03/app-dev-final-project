# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  coursename   :string
#  coursenum    :string
#  day          :string
#  department   :string
#  end_time     :time
#  start_time   :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :integer
#
class Meeting < ApplicationRecord
  belongs_to :classroom, required: true, class_name: "Classroom", foreign_key: "classroom_id", counter_cache: true
end
