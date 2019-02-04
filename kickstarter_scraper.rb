# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  kickstarters_hash = {}

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = kickstarter.css('li.project.grid_4')
  # title = projects.css('div.project-card h2.bbcard_name strong a').text
  # image = projects.css('div.project-thumbnail a img').attribute('src').value
  # description = projects.css('p.bbcard_blurb').text
  # location = projects.css('ul.project-meta li a span.location-name').text
  # percent_funded = projects.css('ul.project-stats li.first.funded strong').text.gsub("%","").to_i
  # binding.pry
  #
  # kickstarter.css()
  projects.each do |project|
    title = project.css('div.project-card h2.bbcard_name strong a').text
    kickstarters_hash[title.to_sym] = {
      image_link: project.css('div.project-thumbnail a img').attribute('src').value,
      description: description = project.css('p.bbcard_blurb').text,
      location: location = project.css('ul.project-meta li a span.location-name').text,
      percent_funded: project.css('ul.project-stats li.first.funded strong').text.gsub("%","").to_i
    }
  end
    kickstarters_hash
end
