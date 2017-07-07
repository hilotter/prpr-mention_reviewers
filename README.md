# Prpr::MentionReviewers

[Prpr](https://github.com/mzp/prpr) plugin for notifying chat to Pull Request reviewers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prpr-mention_reviewers'
```

## Usage

When you assign Pull request reviewers, it post to chat service too.

To add chat service, use publisher adapter (e.g. [prpr-slack](https://github.com/mzp/prpr-slack)).

## Env

For `MENTION_COMMENT_ROOM` and `MENTION_COMMENT_MEMEBRS`, the same setting as [prpr-mention_comment](https://github.com/mzp/prpr-mention_comment) is used.

```
MENTION_COMMENT_ROOM - room name to post mention.
MENTION_COMMENT_MEMEBRS - a file name to map github username to chat service one. (Default: MEMBERS.md)
MENTION_REVIEWERS_BODY - notification message body. (Default: 'Please review my PR: %{title}')
```

`%{field_name}` of `REVIEW_LABEL_NOTIFICATION` is replaced with corresponding value in [pull request payload](https://developer.github.com/v3/pulls/#get-a-single-pull-request) (e.g. `title`, or `body`).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

