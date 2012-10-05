Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |expected_users_table|
  rows = find("table").all('tr')
  table = rows.map { |r| r.all("td,th").map { |c| c.text.strip } }
  expected_users_table.diff!(table)
end
