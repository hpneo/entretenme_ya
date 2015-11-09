class ContentsController < ApplicationController
  def index
  end

  def show
    @content = Content.find(params[:id])
  end

  def search
    @term = params[:term]
    @content_type = params[:content_type].present? ? params[:content_type].singularize.to_sym : :movie

    @results = Content.search(@term, @content_type)
  end
end
