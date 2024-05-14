Rails.application.routes.draw do
  get("/", { :controller => "miscellaneous", :action => "home" })

  post("/submit",{ :controller => "meetings", :action => "index" })

  # Routes for the Meeting resource:

  # CREATE
  post("/insert_meeting", { :controller => "meetings", :action => "create" })
          
  # READ
  get("/meetings", { :controller => "meetings", :action => "index" })
  
  get("/meetings/:path_id", { :controller => "meetings", :action => "show" })
  
  # UPDATE
  
  post("/modify_meeting/:path_id", { :controller => "meetings", :action => "update" })
  
  # DELETE
  get("/delete_meeting/:path_id", { :controller => "meetings", :action => "destroy" })

  #------------------------------

  # Routes for the Classroom resource:

  # CREATE
  post("/insert_classroom", { :controller => "classrooms", :action => "create" })
          
  # READ
  get("/classrooms", { :controller => "classrooms", :action => "index" })
  
  get("/classrooms/:path_id", { :controller => "classrooms", :action => "show" })
  
  # UPDATE
  
  post("/modify_classroom/:path_id", { :controller => "classrooms", :action => "update" })
  
  # DELETE
  get("/delete_classroom/:path_id", { :controller => "classrooms", :action => "destroy" })

  #------------------------------

  # Routes for the Building resource:

  # CREATE
  post("/insert_building", { :controller => "buildings", :action => "create" })
          
  # READ
  get("/buildings", { :controller => "buildings", :action => "index" })
  
  get("/buildings/:path_id", { :controller => "buildings", :action => "show" })
  
  # UPDATE
  
  post("/modify_building/:path_id", { :controller => "buildings", :action => "update" })
  
  # DELETE
  get("/delete_building/:path_id", { :controller => "buildings", :action => "destroy" })

  #------------------------------

end
