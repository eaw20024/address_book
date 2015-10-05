require "./contact"

class AddressBook
    
    attr_reader :contacts
    
    def initialize
       @contacts = []
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
eric.middle_name = "Anthony"
eric.last_name = "Washington"
eric.add_phone_number("Cell", "202-220-2200")
eric.add_address("Home", "123 Main St SW", "", "Washington, DC", "DC", "20024")

puts eric.to_s('full_name')
puts eric.print_addresses
puts eric.print_phone_numbers

address_book.contacts.push(eric)
address_book.print_contact_list
