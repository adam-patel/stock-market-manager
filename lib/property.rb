class Property

  # for property investments

  def initialize
    @property_name # give you property a name
    @property_address # first line of address
    @property_postcode # postcode
    @ledger = []
    @rentpcm = 1400
    @managementfee = 0.09
    @rent_date
    @tenancy_start_date
    @tenancy_end_date
  end

  # what date in the month should you expect rent to arrive? e.g.12th
  # tenancy start and end dates

  def property_setup(property_name, property_address, property_postcode)
    # runs when a new property is created within User account
    # asks questions about the property and stores answers on the property object
    @property_name = property_name
    @property_address = property_address
    @property_postcode = property_postcode
  end

  def summary
    @summary = @property_name + " " + @property_address + " " + @property_postcode
  end

  def rent_checker
    # checks with ledger to see if rent figure has been recorded on rentdate
    # if rent not enered, asks user if rent has been received
  end

  def rent_paid
    # records a rental payment to the ledger
  end

  def expense
    # records an expense incurred
  end

end
