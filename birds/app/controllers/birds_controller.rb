class BirdsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    unless (['name', 'family', 'continents'] - params.keys).count.zero?
      return head :bad_request
    end

    @bird = Bird.new name: params['name'], family: params['family'], continents: params['continents'], visible: params['visible']
    if @bird.save
      render status: 201, json: @bird
    else
      head :bad_request
    end
  end

  def index
    render json: Bird.all(visible: true)
  end

  def show
    unless Bird.exists?(id: params['id'])
      return head :not_found
    end
    render json: Bird.all(id: params['id'], visible: true)
  end

  def destroy
    unless Bird.exists?(id: params['id'])
      return head :not_found
    end
    Bird.destroy_all(id: params['id'])
    head :ok
  end
end
