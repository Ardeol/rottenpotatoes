Given /^the following movies exist:$/ do |table|
  table.hashes.each do |row|
    Movie.create!(row)
  end
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |mov, name|
  #pending # express the regexp above with the code you wish you had
  movie = Movie.find_by_title(mov)
  puts movie.director
  director = movie.director
  if director.respond_to? :should
    director.should == name
  else
    assert_equal director, name
  end
end