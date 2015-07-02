class Interconnection < ActiveRecord::Base
  belongs_to :node
  belongs_to :child_node, class_name: 'Node'
end
