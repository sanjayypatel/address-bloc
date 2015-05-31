require_relative "../models/address_book"

class MenuController

  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View Entry Number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "
    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      view_entry_n
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Goodbye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end
  def view_entry_n
    print "Entry number: "
    n = gets.to_i
    if n < @address_book.entries.size
      entry = @address_book.entries[n]
      puts entry.to_s
      entry_submenu(entry)
    else
      system "clear"
      puts "#{n} is not valid entry"
      view_entry_n
    end
    system "clear"
    puts "End of entries"
  end
  def create_entry
    system "clear"
    puts "Create new AddressBloc entry"
    print "Name: "
    name = gets
    print "Phone Number: "
    phone = gets
    print "Email: "
    email = gets

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end
  def search_entries

  end
  def read_csv

  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    
    case selection
    when 'n'
    when 'd'
    when 'e'
    when 'm'
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not valid input"
      entry_submenu(entry)
    end
  end

end