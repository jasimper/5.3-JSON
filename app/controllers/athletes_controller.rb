class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
    respond_to do |format|
      format.json { render json: @athletes }
    end
  end

  def create
    @athlete = Athlete.new(athlete_params)
    respond_to do |format|
      if @athlete.save
        format.json { render json: @athlete }
      else
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
    respond_to do |format|
      format.json { render json: @athlete }
    end
  end

  def update
    @athlete = Athlete.find(params[:id])
    respond_to do |format|
      if @athlete.update_attributes(athlete_params)
        format.json { render json: @athlete }
      else
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :sport, :weight, :height, :personal_record, :retired_at)
  end
end
