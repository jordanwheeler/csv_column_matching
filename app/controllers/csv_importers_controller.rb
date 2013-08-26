class CsvImportersController < ApplicationController

  def index
  end

  def import
    @column = params[:column]
    @matched_column = params[:matched_column]
    @csv1name = params[:csv1].original_filename
    @csv2name = params[:csv2].original_filename
    @results = CsvImporter.matching_data(CsvImporter.import(params[:csv1]), CsvImporter.import(params[:csv2]), @column, @matched_column)
  end
end