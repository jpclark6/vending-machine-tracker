describe 'as a user' do
  before(:each) do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine_1 = @sam.machines.create(location: "Don's Mixed Drinks")
    @machine_2 = @sam.machines.create(location: "Turing Basement")
    @snack_1 = Snack.create(name: 'Snickers', price: 2, machines: [@machine_1, @machine_2])
    @snack_2 = Snack.create(name: 'Mars', price: 10, machines: [@machine_1])
    @snack_3 = Snack.create(name: 'Soda', price: 1, machines: [@machine_2])
  end
  it 'can see the names of all snacks associated with vending machine with price' do
    visit machine_path(@machine_1)
    expect(page).to have_content("Name: #{@snack_1.name}")
    expect(page).to have_content("Price: $#{@snack_1.price}")
    expect(page).to have_content("Name: #{@snack_2.name}")
    expect(page).to have_content("Price: $#{@snack_2.price}")
    expect(page).to have_no_content("Name: #{@snack_3.name}")
    expect(page).to have_no_content("Price: $#{@snack_3.price}")
  end
  it 'can see average price for all snacks in the machine' do
    visit machine_path(@machine_2)
    expect(page).to have_content("Average price: $#{(@snack_3.price + @snack_1.price)/2}")
  end
end
