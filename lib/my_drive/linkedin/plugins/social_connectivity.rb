social = []

files.each do |file|
  data = JSON.load(File.read(File.join("data/telematics", file)))
  companies = data['companies']['values']
  connectivity = {}
  companies.each do |company|
    name = company['name'] 
    followers = company['numFollowers']
    company['twitterId'] == nil || company['twitterId'].empty?  ? ( twitter = 'NA' ) : ( twitter = company['twitterId'] )
    company['websiteUrl'] == nil || company['websiteUrl'].empty? ? ( website = 'NA' ) : ( website = company['websiteUrl'] )
    company['blogRssUrl'] == nil || company['blogRssUrl'].empty? ?  ( blog = 'NA' ) : ( blog = company['blogRssUrl'] )
    social << { name: name, followers: followers, twitter: twitter, website: website, blog: blog }
    puts social.last
  end

end

CSV.open("social_connectivity.csv", "wb") do |csv|
  csv << [ 'name', 'followers', 'twitter', 'website', 'blog']
  social.each {|company| csv << company.values}
end
