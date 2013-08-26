class CsvMatchersController < ApplicationController

  def results
    a = CsvMatcher.new
    @initial = a.initial_data
    @search = a.search_data
    @results = a.matching_data(@initial, @search)
  end

  def index
  end

end