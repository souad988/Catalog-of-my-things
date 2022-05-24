require_relative './app'

class Run
  include Inputs
  def main
    app = App.new
    flag = true
    while flag
      min_option = 1
      max_option = 13
      app.display_menu
      option = input_number(min_option, max_option)
      flag = false if option == max_option
      app.display_choice(option) if option >= min_option && option <= max_option
    end
  end
end

run = Run.new
run.main
