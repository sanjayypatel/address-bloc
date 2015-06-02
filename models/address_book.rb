require_relative 'entry.rb'
require 'csv'

class AddressBook
  attr_accessor :entries

  def initialize 
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def binary_search(name)
    # set upper and lower to first/last indices
    lower = 0
    upper = entries.length - 1

    # repeat comparisons until upper and lower cross
    while lower <= upper
      # compare the midpoint of the collection to search term
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
      if name == mid_name
        # if it's found, return it
        return entries[mid]
      elsif name < mid_name
        # if the name comes before the mid_name alphabetically, change the upper limit
        upper = mid - 1
      elsif name > mid_name
        # if the name comes after the mid_name alphabetically, change the lower limit
        lower = mid + 1
      end
    end
    return nil
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    return csv.count
  end
end