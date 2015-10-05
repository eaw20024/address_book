require "./contact"

class AddressBook
  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end
  
  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

eric = Contact.new
eric.first_name = "Eric"
eric.last_name = "Washington"
eric.add_phone_number("Home", "123-456-7890")
eric.add_phone_number("Work", "456-789-0123")
eric.add_address("Home", "123 Main St.", "", "Washington", "DC", "12345")


address_book.contacts.push(eric)

#address_book.print_contact_list

address_book.find_by_name("e")