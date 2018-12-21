describe 'as a user' do
  before(:each) do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine_1 = @sam.machines.create(location: "Don's Mixed Drinks")
    @machine_2 = @sam.machines.create(location: "Turing Basement")
    @machine_3 = @sam.machines.create(location: "DIA Alien Hideout")
    @snack_1 = Snack.create(name: 'Snickers', price: 2, machines: [@machine_1, @machine_2])
    @snack_2 = Snack.create(name: 'Mars', price: 10, machines: [@machine_1])
    @snack_3 = Snack.create(name: 'Soda', price: 1, machines: [@machine_2])
    @snack_4 = Snack.create(name: 'Goo', price: 7749, machines: [@machine_3])
  end
  it 'can see a snack show page' do
    visit snack_path(@snack_1)
    expect(page).to have_content("Name: #{@snack_1.name}")
  end
  it 'can see the price for a snack' do
    visit snack_path(@snack_1)
    expect(page).to have_content("Price: $#{@snack_1.price}")
  end
  it 'can see all locations the snack is at' do
    visit snack_path(@snack_1)
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
    expect(page).to have_no_content("DIA Alien Hideout")
  end
  it 'can see the average price for the snacks in other vending machines and count of other items' do
    visit snack_path(@snack_1)
    expect(page).to have_content("Don's Mixed Drinks: 2 snacks at average price $#{(2 + 10)/2}")
    expect(page).to have_content("Turing Basement: 2 snacks at average price $1.50")
    visit snack_path(@snack_4)
    expect(page).to have_content("DIA Alien Hideout: 1 snack at average price $7,749")
  end
end
