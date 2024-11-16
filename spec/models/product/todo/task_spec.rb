require 'rails_helper'

RSpec.describe Product::Todo::Task, type: :model do
  describe 'when db schema' do
    let(:model) { described_class.column_names }

    %w[user_id title description deadline].each do |field|
      it { expect(model).to include(field) }
    end
  end
end
