require 'rails_helper'

describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks)}
  end
  describe 'instance methods' do
    before(:each) do
      @sam = Owner.create(name: "Sam's Snacks")
      @machine_1 = @sam.machines.create(location: "Don's Mixed Drinks")
      @machine_2 = @sam.machines.create(location: "Turing Basement")
      @machine_3 = @sam.machines.create(location: "Turing Basement")
      @snack_1 = Snack.create(name: 'Snickers', price: 2, machines: [@machine_1, @machine_2])
      @snack_2 = Snack.create(name: 'Mars', price: 10, machines: [@machine_1])
      @snack_3 = Snack.create(name: 'Soda', price: 1, machines: [@machine_2, @machine_3])
    end
    it 'can count snacks in machine' do
      expect(@machine_1.snack_count).to eq(2)
      expect(@machine_3.snack_count).to eq(1)
    end
  end
end
