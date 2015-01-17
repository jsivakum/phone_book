require('sinatra')
require('sinatra/reloader')
require('./lib/phone')
require('./lib/contacts')
also_reload('lib/**/*.rb')

get('/') do
  @list = Contacts.list_contact_names()
  erb(:index)
end

post('/add_to_list_of_contacts') do
  @name = params['name']
  @type = params['type']
  @number = params['number']
  contact = Contacts.new()
  phone = Phone.new(:type => @type, :number => @number)
  phone2 = Phone.new(:type => params['type2'], :number => params['number2'])
  phone3 = Phone.new(:type => params['type3'], :number => params['number3'])
  phone4 = Phone.new(:type => params['type4'], :number => params['number4'])
  contact.add_new({:name => @name, :number => phone})
  contact.add_new({:number => phone2})
  contact.add_new({:number => phone3})
  contact.add_new({:number => phone4})
  redirect('/')
end

post('/add_number_to_contact') do
  @name = params['name']
  @type = params['type']
  @number = params['number']
  contact = Contacts.search_for_contact(@name)
  phone = Phone.new(:type => @type, :number => @number)
  contact.add_new({ :number => phone})
  erb(:number_added)
end

get('/details/:name') do
  @name = params['name']
  @details_to_print = Contacts.search_for_contact(@name)
  erb(:results)
end
