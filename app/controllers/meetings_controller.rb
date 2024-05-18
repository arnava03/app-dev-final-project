class MeetingsController < ApplicationController
  def index

    place = params.fetch("building_id")
    building = Building.find_by(id: place)

    given_x = building.xcoord.to_f
    given_y = building.ycoord.to_f
    
    date = params.fetch("date")
    day = Date.parse(date).strftime("%A")

    @day_temp = day.dup

    full_time = params.fetch("time")
    time_new_parsed = Time.parse(full_time).strftime("%H:%M")
    time_new = "2000-01-01 "+time_new_parsed+"%"

    @time_new_temp = time_new.dup 
    @time_temp = time_new_parsed.dup 
    if ((day != "Sunday") && (day != "Saturday"))
      meetings = Meeting.where(:day => day).where("start_time <= ?", time_new).where("end_time >= ?", time_new)
      classrooms = meetings.joins(:classroom).pluck('classrooms.id').uniq
      classrooms_without_meetings = Classroom.where.not(id: classrooms)
    else 
      classrooms_without_meetings = Classroom.all
    end

    def distance(x1, y1, x2, y2)
      Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    end

    @sorted_classrooms = classrooms_without_meetings.reject do |classroom|
      building = classroom.building
      building.xcoord.nil? || building.ycoord.nil?
    end.sort_by do |classroom|
      building = classroom.building
      [distance(given_x, given_y, building.xcoord.to_f, building.ycoord.to_f), classroom.name]
    end

    render({ :template => "meetings/index" })
  end
end
