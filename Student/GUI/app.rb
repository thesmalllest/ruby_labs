require 'fox16'
include Fox

require_relative '../Views/student_list_view'
require_relative '../Controllers/student_list_controller'

if __FILE__ == $0
  app = FXApp.new
  view = StudentsListView.new(app)
  app.create
  app.run
end