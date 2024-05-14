class ClassroomsController < ApplicationController
  def index
    matching_classrooms = Classroom.all

    @list_of_classrooms = matching_classrooms.order({ :created_at => :desc })

    render({ :template => "classrooms/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_classrooms = Classroom.where({ :id => the_id })

    @the_classroom = matching_classrooms.at(0)

    render({ :template => "classrooms/show" })
  end

  def create
    the_classroom = Classroom.new
    the_classroom.name = params.fetch("query_name")
    the_classroom.building_id = params.fetch("query_building_id")
    the_classroom.meetings_count = params.fetch("query_meetings_count")

    if the_classroom.valid?
      the_classroom.save
      redirect_to("/classrooms", { :notice => "Classroom created successfully." })
    else
      redirect_to("/classrooms", { :alert => the_classroom.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_classroom = Classroom.where({ :id => the_id }).at(0)

    the_classroom.name = params.fetch("query_name")
    the_classroom.building_id = params.fetch("query_building_id")
    the_classroom.meetings_count = params.fetch("query_meetings_count")

    if the_classroom.valid?
      the_classroom.save
      redirect_to("/classrooms/#{the_classroom.id}", { :notice => "Classroom updated successfully."} )
    else
      redirect_to("/classrooms/#{the_classroom.id}", { :alert => the_classroom.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_classroom = Classroom.where({ :id => the_id }).at(0)

    the_classroom.destroy

    redirect_to("/classrooms", { :notice => "Classroom deleted successfully."} )
  end
end
