class ActorsController < ApplicationController
  def destroy
    the_id = params.fetch("path_id")
    matching_records = Actor.where({ :id => the_id })
    the_actor = matching_records.at(0)

    the_actor.destroy

    redirect_to("/actors")
  end

  def update
    actor_id = params.fetch("path_id")
    matching_records = Actor.where({ :id => actor_id })
    actor = matching_records.at(0)

    actor.name = params.fetch("the_name")
    actor.dob = params.fetch("the_dob")
    actor.bio = params.fetch("the_bio")
    actor.image = params.fetch("the_image")

    actor.save
    redirect_to("/actors/#{actor.id}")
  end

  def create
    actor = Actor.new
    actor.name = params.fetch("the_name")
    actor.dob = params.fetch("the_dob")
    actor.bio = params.fetch("the_bio")
    actor.image = params.fetch("the_image")

    actor.save

    redirect_to("/actors")
  end

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
