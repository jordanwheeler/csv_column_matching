class CsvImporter
  extend ActiveModel::Naming

  def self.import(file)
    @csv_data = []
    CSV.foreach(file.path, headers: true) do |row|
      @csv_data << row.to_hash
    end
    @csv_data
  end

  def self.matching_data(initial_data, search_data, column, matched_column)

    matching_data = {}
    i = 1
    initial_data.each do |initial_data|
      search_data.each do |search_data|
        if matched_column.blank?
          if initial_data["#{column}"] == search_data["#{column}"]
            if matching_data.has_key?(initial_data["#{column}"])
              matching_data["#{initial_data[column]}-#{i}"] = search_data
              i += 1
            else
              matching_data[initial_data["#{column}"]] = search_data
            end
          end
          matching_data.delete_if { |k, v| k.nil? || !v.values.any? }
        else
          if initial_data["#{column}"] == search_data["#{column}"]
            if matching_data.has_key?(initial_data["#{column}"])
              matching_data["#{initial_data[column]}-#{i}"] = search_data["#{matched_column}"]
              i += 1
            else
              matching_data[initial_data["#{column}"]] = search_data["#{matched_column}"]
            end
          end
          matching_data.delete_if { |k, v| k.nil? || v.nil? }
        end
      end
    end
  matching_data
  end

  def to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

end