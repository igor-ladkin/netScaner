class Node < ActiveRecord::Base
  has_one :overview
  has_many :interconnections
  has_many :child_nodes, through: :interconnections

  validates :mac_address, :type, presence: true

  def parent_node
    Interconnection.find_by(child_node_id: id).node
  end
end
