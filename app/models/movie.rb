class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :director, :release_date

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def movies_with_same_director
    unless director.nil? or director.length == 0
      Movie.where(:director => director)
    else
      nil
    end
  end
end

