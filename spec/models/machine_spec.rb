require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end
  describe 'instance methods' do
    before(:each) do
      @sam = Owner.create(name: "Sam's Snacks")
      @machine_1 = @sam.machines.create(location: "Don's Mixed Drinks")
      @machine_2 = @sam.machines.create(location: "Turing Basement")
      @snack_1 = Snack.create(name: 'Snickers', price: 2, machines: [@machine_1, @machine_2])
      @snack_2 = Snack.create(name: 'Mars', price: 10, machines: [@machine_1])
      @snack_3 = Snack.create(name: 'Soda', price: 1, machines: [@machine_2])
    end
    it 'can calculate average price in machine' do
      expect(@machine_2.average_price).to eq(1.5)
    end
  end
end
