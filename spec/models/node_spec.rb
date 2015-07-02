require 'rails_helper'

RSpec.describe Node, type: :model do
  it { is_expected.to validate_presence_of :mac_address }
  it { is_expected.to validate_presence_of :type }
  it { is_expected.to have_one :overview }
  it { is_expected.to have_many :interconnections }
  it { is_expected.to have_many :child_nodes }

  describe '#parent_node' do
    subject { create :workstation }

    let(:parent_node) { create :switch }
    let(:interconnection) { create :interconnection, node: parent_node, child_node: subject }

    it 'searches for parent node by device_id' do
      expect(Interconnection).to receive(:find_by).with(child_node_id: subject.id).and_return(interconnection)
      subject.parent_node
    end
  end
end
