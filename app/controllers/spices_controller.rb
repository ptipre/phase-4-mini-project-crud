class SpicesController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index

        spices = Spice.all
        render json: spices

    end

    def create

        spice = Spice.create(spice_params)
        render json: spice, status: :created

    end

    def update

        spice = find_spice
        spice.update(spice_params)

        render json: spice, status: :ok

    end

    def destroy

        spice = find_spice
        spice.destroy

    end

    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_message 
        render json: {error: "Spice not found"}, status: :not_found
    end
end
