module Prpr
  module Handler
    class MentionReviewers < Base
      handle Event::PullRequest, action: 'review_requested' do
        Prpr::Action::MentionReviewers::Mention.new(event).call
      end
    end
  end
end
