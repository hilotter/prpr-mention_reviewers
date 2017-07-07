module Prpr
  module Action
    module MentionReviewers
      class Mention < Base
        def call
          Publisher::Adapter::Base.broadcast message
        end

        private

        def message
          Prpr::Publisher::Message.new(body: body, from: from, room: room)
        end

        def pull_request
          event.pull_request
        end

        def body
          <<-END
#{mention_targets_body}
#{comment_body}
#{pull_request.url}
          END
        end

        def mention_targets_body
          reviewer_mention_names.join(' ')
        end

        def comment_body
          comment = env.format(:mention_reviewers_body, pull_request)
          comment.empty? ? "Please review my PR: #{pull_request.title}" : comment
        end

        def reviewer_mention_names
          reviewers.map { |old| members[old] || old }
        end

        def reviewers
          @reviewers ||= pull_request.requested_reviewers.map { |r| "@#{r.login}" }
        end

        def from
          event.sender
        end

        def room
          env[:mention_comment_room]
        end

        def members
          @members ||= config.read(name).lines.map { |line|
            if line =~ / \* (\S+):\s*(\S+)/
              [$1, $2]
            end
          }.to_h
        rescue
          @members ||= {}
        end

        def config
          @config ||= Config::Github.new(repository_name)
        end

        def env
          Config::Env.default
        end

        def name
          env[:mention_comment_members] || 'MEMBERS.md'
        end

        def repository_name
          event.repository.full_name
        end
      end
    end
  end
end
