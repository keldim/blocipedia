module CollaboratorsHelper
  def is_user_collaborator? (user, collaborators)
    collaborators.each do |collaborator|
      if collaborator.user.id == user.id
        return true
      end
    end
    false
  end
end
