# Example of global ranking system given to me from @clatyonflesher

global_list = (hash of every movie ever listed as the keys to a hash with all values set to 0)
users.each do |user|
  user.my_movies.each do |movie|
    global_list[movie] += movie.rank
  end
end
