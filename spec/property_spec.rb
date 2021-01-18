require 'property'

describe Property do

  it 'can store information about a property' do
    property = Property.new
    property.property_setup("Property Name", "14 Some Street, Somewhere", "FM34 4PQ")
    expect(property.summary).to eq ("Property Name 14 Some Street, Somewhere FM34 4PQ")
  end

  # it 'can record rental income received to the ledger' do
  #   property = Property.new
  #   property.rent_paid(1400)
  #   expect(property.ledger).to eq()
  # end

end
