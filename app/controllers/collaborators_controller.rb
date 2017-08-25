class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new
    @collaborator.wiki_id = @wiki.id
    @collaborator.user_id = @user.id
  end

  def destroy

@collaborator = Collaborator.find(params[:id])

if @collaborator.destroy
  flash[:notice] = "\"#{@collaborator.user_id.email}\" was deleted successfully."
  redirect_to edit_wiki_path
else
  flash.now[:alert] = "There was an error deleting the collaborator."
  render :new
end
  end
end
