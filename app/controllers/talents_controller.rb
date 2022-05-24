# frozen_string_literal: true

class TalentsController < ApplicationController
  before_action :set_talent, only: %i[show update destroy]
  def index
    @talents = Talent.all
    render json: @talents, status: :ok
  end

  def show
    render json: @talent, status: :ok
  end

  def create
    @talent = Talent.create(talent_params)
    render json: @talent, status: :created
  end

  def update
    @talent.update(talent_params)
    render json: @talent, status: :ok
  end

  def destroy
    @talent.destroy
    render json: { message: 'Talent is successfully destroyed' }, status: :ok
  end

  private

  def talent_params
    params.require(:talent)
          .permit(:skill, :description, :author_id, :course_id)
  end

  def set_talent
    @talent = Talent.find(params[:id])
  end
end
