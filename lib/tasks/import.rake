require 'roo'

namespace :import do
  desc "Import meetings from Excel file"
  task meetings: :environment do
    file = './data/meetings.xlsx'
    spreadsheet = Roo::Spreadsheet.open(file)

    (2..spreadsheet.last_row).each do |i|
      day = spreadsheet.cell(i, 'E')
      start_time = spreadsheet.cell(i, 'F')
      end_time = spreadsheet.cell(i, 'G')
      classroom_id = spreadsheet.cell(i, 'H')
      department = spreadsheet.cell(i, 'B')
      coursenum = spreadsheet.cell(i, 'C')
      coursename = spreadsheet.cell(i, 'D')

      Meeting.create!(
        day: day,
        start_time: start_time,
        end_time: end_time,
        classroom_id: classroom_id,
        department: department,
        coursenum: coursenum,
        coursename: coursename
      )
    end
  end

  task classrooms: :environment do
    file = './data/classrooms.xlsx'
    spreadsheet = Roo::Spreadsheet.open(file)

    (2..spreadsheet.last_row).each do |i|
      name = spreadsheet.cell(i, 'B')
      building_id = spreadsheet.cell(i, 'C')

      Classroom.create!(
        name: name,
        building_id: building_id
      )
    end
  end

  task buildings: :environment do
    file = './data/buildings.xlsx'
    spreadsheet = Roo::Spreadsheet.open(file)

    (2..spreadsheet.last_row).each do |i|
      name = spreadsheet.cell(i, 'B')
      address = spreadsheet.cell(i, 'C')
      xcoord = spreadsheet.cell(i, 'D')
      ycoord = spreadsheet.cell(i, 'E')

      Building.create!(
        name: name,
        address: address,
        xcoord: xcoord,
        ycoord: ycoord
      )
    end
  end
end
