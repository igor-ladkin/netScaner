require 'rails_helper'

RSpec.describe Interconnection, type: :model do
  it { is_expected.to belong_to :node }
  it { is_expected.to belong_to :child_node }
end
