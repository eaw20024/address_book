require "./contact"

class AddressBook
  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end
  
  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end
  
  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

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
address_book.find_by_phone_number("123")  
