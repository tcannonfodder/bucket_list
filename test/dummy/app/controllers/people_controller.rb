class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.create(params[:person])

    redirect_to person_path @person
  end

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])    
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update_attributes(params[:person])
  end

  def delete
    @person = Person.destroy(params[:id])
  end
end
