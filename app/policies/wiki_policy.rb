class WikiPolicy < ApplicationPolicy
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
end
