require('rspec')
require('phone')
require('contacts')
require('pry')

describe('Contacts') do
  describe('#add') do
    it("Adds a contact with Name and a Phone Number of class Phone") do
      contact = Contacts.new()
      phone= Phone.new(:type => "work", :number => "306-450-2511")
      contact.add_new(:name => "Jay", :number => phone)
      expect(contact.name()).to(eq("Jay"))
      expect(contact.numbers().pop.number()).to(eq("306-450-2511"))
    end
  end

  describe('#add') do
    it("Adds to an existing contact a phone number of class Phone") do
      contact = Contacts.new()
      work_phone= Phone.new(:type => "work", :number => "306-450-2511")
      contact.add_new(:name => "Jay", :number => work_phone)
      cell_phone = Phone.new(:type => "cell", :number => "555-555-5555")
      contact.add_new(:number => cell_phone)
      expect(contact.name()).to(eq("Jay"))
      expect(contact.numbers[0].number()).to(eq("306-450-2511"))
      expect(contact.numbers[1].number()).to(eq("555-555-5555"))
    end
  end

  describe('#list_contact_names') do
    it("returns an array of all the contact names") do
      Contacts.clear()
      contact = Contacts.new()
      work_phone= Phone.new(:type => "work", :number => "306-450-2511")
      contact.add_new(:name => "Jay", :number => work_phone)
      contact2 = Contacts.new()
      cell_phone = Phone.new(:type => "cell", :number => "555-555-5555")
      contact2.add_new(:name =>"Mike", :number => cell_phone)
      list = Contacts.list_contact_names
      expect(list).to(eq(["Jay", "Mike"]))
    end
  end

end

describe('Phone') do
  describe('.new') do
    it("Creates a phone class with a type and one phone number") do
      phone = Phone.new(:type => "work", :number => "111-111-1111")
      expect(phone.type()).to(eq("work"))
    end
  end
end
