Feature: Given I am reading a post
		As a user who wants to express a liking or dislike for the post
		I want to be able to upvote or downvote the post

		@javascript
		Scenario: Upvoting a post
				Given I am viewing a post
				When I click on "+1"
				Then I should see "1" within "vote_count"

		@javascript
		Scenario: Downvoting a post
				Given I am viewing a post
				When I click on "-1"
				Then I should see "1" within "vote_count"