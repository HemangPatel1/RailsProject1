Given(/^I am viewing a post$/) do
  Post.create(title: 'Foooooo')
  visit post_path(Post.last)
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on '+1'
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |arg1, arg2|
  visit post_path(Post.last)
end