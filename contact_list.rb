require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  class << self

    def menu
      "Here is a list of available commands:
        new    - Create a new contact
        list   - List all contacts
        show   - Show a contact
        search - Search contacts"
    end 

    def new_id
      puts "Please enter the id of the contact"
      id_input = STDIN.gets.chomp
      return id_input.to_s
    end

    def new_name 
      puts "Please enter the full name of the contact"
      name_input = STDIN.gets.chomp
      return name_input.to_s
    end

    def new_email
      puts "Please enter the email of the contact"
      email_input = STDIN.gets.chomp
      return email_input.to_s
    end
  end
end

  case ARGV[0]
    when 'list' then Contact.all
    when 'new' then Contact.create(ContactList.new_id, ContactList.new_name, ContactList.new_email)
    when 'show' then Contact.find(ARGV[1])
    when 'search' then Contact.search(ARGV[1])
    else
      puts ContactList.menu
    end

