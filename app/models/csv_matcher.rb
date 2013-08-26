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

end
