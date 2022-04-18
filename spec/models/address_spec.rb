require 'rails_helper'

RSpec.describe Address, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }

    it { is_expected.not_to validate_presence_of(:complement) }
    it { is_expected.not_to validate_presence_of(:code_ibge) }
  end

  describe '#initialize' do
    subject { described_class.new(params) }

    let(:params) do
      {
        street: 'Rua a',
        zipcode: '01234567'
      }
    end

    it { is_expected.to have_attributes(params) }
  end
end
