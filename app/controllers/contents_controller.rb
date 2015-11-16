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

    if @term.present?
      @results = Content.search(@term, @content_type)
    else
      @results = []
    end
  end

  def recommendations
    data = User.all.inject({}) do |hash, user|
      hash[user.email] = Rate.where(rater_id: user.id).inject({}) do |rate_hash, rate|
        rate_hash[rate.rateable.name] = rate.stars
        rate_hash
      end
      hash
    end

    suggestor = Suggestor::Suggestor.new(data)
    @recommendations = suggestor.recommended_to(current_user.email)
  end
end
