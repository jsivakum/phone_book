class Contacts
  @@list_of_contacts = []
  attr_reader(:name, :numbers)

  define_method(:initialize) do
    @name = ""
    @numbers = []
  end

  define_singleton_method(:list_contact_names) do
    list_of_contact_names = []
    @@list_of_contacts.each() do |contact|
      list_of_contact_names.push(contact.name())
    end
    list_of_contact_names
  end

  define_method(:add_new) do |attributes|
    if(attributes[:name] == nil)
      @numbers.push(attributes[:number])
    else
      @name = attributes[:name]
      @numbers.push(attributes[:number])
      @@list_of_contacts.push(self)
      @numbers
    end
  end

  define_singleton_method(:clear) do
    @@list_of_contacts = []
  end


end
