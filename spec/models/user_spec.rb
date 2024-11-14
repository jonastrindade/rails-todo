require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin) { create(:user, role: 'admin') }
  let(:common) { create(:user, role: 'common') }

  describe 'when db schema' do
    let(:model) { described_class.column_names }

    %w[email encrypted_password cpf role].each do |field|
      it { expect(model).to include(field) }
    end
  end

  describe "#admin?" do
    it "returns true" do
      expect(admin.admin?).to be true
    end
  end

  describe "#common?" do
    it "returns true" do
      expect(common.common?).to be true
    end
  end
end
