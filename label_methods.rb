require_relative 'label'

@labels = []

# List all labels (e.g. 'Gift', 'New')
def list_all_labels
  labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
end