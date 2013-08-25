require 'csv'

class CsvMatcher
  extend ActiveModel::Naming

    def initial_data
      data = File.read('lib/CVNumbersWithNames.csv')
      csv = CSV.parse(data, :headers => true)
      csv_data = []
      csv.each do |row|
        csv_data << row.to_hash
      end
      csv_data
    end

    def search_data
    csv_numbers_to_search_hash = []
    csv_numbers_to_search_data = File.read('lib/CVNumbers.csv')
    csv_numbers_to_search_data = CSV.parse(csv_numbers_to_search_data, :headers => true)
    csv_numbers_to_search_data.each do |row|
      csv_numbers_to_search_hash << row.to_hash
    end
    csv_numbers_to_search_hash
    end

    def matching_data(initial_data, search_data)

    matching_set_of_data = {}
    search_data.each do |search_number|
      initial_data.each do |intial_data|
        matching_set_of_data[search_number.values.first] = intial_data["Number"] if intial_data["CTName"] == search_number.values.first
      end
    end
    matching_set_of_data
    end

end
