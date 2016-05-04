require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
    # TODO: Assign parameter values to instance variables.
  end

  def to_s
    @id.to_s + ': ' + @name + ' (' + @email + ')'
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      contacts = CSV.read('contacts.csv')
      contacts = contacts.map {|contact| self.new(contact[0], contact[1], contact[2])}
      puts contacts
      puts "\n#{contacts.length} records total"  
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(id, name, email) 
      CSV.open('contacts.csv', 'a+t') do |contacts|
        contacts << [id, name, email]
      end
      Contact.new(id, name, email)
    end

      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
   
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      contacts = CSV.read('contacts.csv')
      found = false  
      contacts.each do |contact|
        if contact[0] == id.to_s
          contact = Contact.new(contact[0], contact[1], contact[2])
          puts contact
          found = true
        end 
      end
      puts "not found" if found == false
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      found = false
      contacts = CSV.read('contacts.csv')
      contacts.each do |contact|
        if contact.join.include?(term)
          contact = Contact.new(contact[0], contact[1], contact[2])
          puts contact
          found = true 
        end
      end
      puts "not found" if found == false
    end

      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
  end
end 

# puts Contact.all
# puts Contact.create("4", "Shiming", "shi_shiming@hotmail.com")
# Contact.find(1)

