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
        rate_hash[rate.id] = rate.stars
        rate_hash
      end
      hash
    end

    suggestor = Suggestor::Suggestor.new(data)
    recommended_contents = suggestor.recommended_to(current_user.email)
    recommended_contents_ids = recommended_contents.map { |item| item.first }

    @recommendations = Content.where(id: recommended_contents_ids)
  end
end
