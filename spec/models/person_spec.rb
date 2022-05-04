require 'rails_helper'

RSpec.describe Person, type: :model do
  context '#validations' do
    let!(:person) { create(:person) }
    let(:invalid_person) { build(:person, :invalid_person)}

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:fone_number) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:status) }
    
    it { is_expected.not_to validate_presence_of(:address_id) }

    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }

    it { expect(person.valid?).to eq true }

    it { expect(invalid_person.valid?).to eq false }

    it 'should return errors 'do
      invalid_person.save
      expect(invalid_person.errors.size).to eq 3
    end
  end

  describe '#initialize' do
    subject { described_class.new(params) }

    let(:params) do
      {
        name: 'João',
        cpf: '01234567890',
        cns: '174817056080009'
      }
    end

    it { is_expected.to have_attributes(params) }
  end
end
