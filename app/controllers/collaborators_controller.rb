class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
    @collaborators = @wiki.collaborators
  end

  def create
#loop over all the users in the params[:collaborator][:users]
      #if current value is different from zero
          #find user by email
          #create a collaborator and save it
    listOfCollabs = params[:collaborator][:users]
    @wiki = Wiki.where(params[:wiki_id]).first
    @wiki.collaborators.destroy_all
    listOfCollabs.each do |collab|
      if collab != "0"
        user = User.where(email: collab).first
        collaborator = Collaborator.new
        collaborator.wiki = @wiki
        collaborator.user = user
        collaborator.save
      end
    end
    redirect_to(edit_wiki_path(@wiki))
  end

  
end
