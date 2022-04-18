require 'rails_helper'

RSpec.describe Person, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:fone_number) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:status) }
    
    it { is_expected.not_to validate_presence_of(:address_id) }
  end

  describe '#initialize' do
    subject { described_class.new(params) }

    let(:params) do
      {
        name: 'João',
        cpf: '01234567890'
      }
    end

    it { is_expected.to have_attributes(params) }
  end
end
