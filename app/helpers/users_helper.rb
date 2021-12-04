module UsersHelper
  def vote_result vote
    vote.to_s(2)
  end
end
