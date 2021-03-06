require 'rails_helper'

describe Category, 'relations' do
  it { should belong_to :store }
  it { should have_many :items }
end

describe Category, 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :lx }
  it { should validate_presence_of :rx }
  it { should validate_presence_of :ty }
  it { should validate_presence_of :by }
  it { should validate_presence_of :store_id }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(20) }
end

describe Category, 'callbacks' do
  sampleCategory = FactoryBot.create(:category)

  it { is_expected.to callback(:format_name).before(:save) }

  it 'will titleize name' do
    expect(sampleCategory.name).to(eq('Dairy'))
  end
end
