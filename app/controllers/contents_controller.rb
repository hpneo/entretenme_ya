class ContentsController < ApplicationController
  def index
    @contents = Content.last(12)
  end

  def show
    @content = Content.find(params[:id])
  rescue
    redirect_to contents_path
  end

  def search
    @term = params[:term]
    @content_type = params[:content_type].present? ? params[:content_type].singularize.to_sym : :movie

    @results = Content.search(@term, @content_type)
  end
end
