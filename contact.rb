require "./phone_number"
require "./address"

class Contact
   
    attr_writer :first_name, :middle_name, :last_name
    attr_reader :phone_numbers, :addresses
    
    def initialize
        @phone_numbers = [] 
        @addresses = []
    end
    
    def add_address(kind, street_1, street_2, city, state, postal_code)
        address = Address.new
        address.kind = kind
        address.street_1 = street_1
        address.street_2 = street_2
        address.city = city
        address.state = state
        address.postal_code = postal_code
        addresses.push(address)
    end
    
    def add_phone_number(kind, number)
        phone_number = PhoneNumber.new
        phone_number.kind = kind
        phone_number.number = number
        phone_numbers.push(phone_number)
    end
        
    def print_addresses
        puts "Addresses"
        addresses.each { |address| puts address.to_s('short') }
    end
            
    def print_phone_numbers
        puts "Phone Numbers"
        phone_numbers.each { |phone_number| puts phone_number }
    end
    
    def first_name
        @first_name
    end
    
    def middle_name
        @middle_name
    end
    
    def last_name
        @last_name
    end
    
    def last_first
        puts "#{last_name}, #{first_name} #{middle_name.slice(0, 1)}" 
    end
    
    def full_name
        puts "#{first_name} #{middle_name} #{last_name}"    
    end
    
    def to_s(format = 'full_name')
        case format
            when 'full_name'
            full_name
            when 'last_name'
            last_name
            when 'first_name'
            first_name
            else
            last_first
        end
    end

end





