# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  #projects: kickstarter.css("li.project.grid_4")

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
  	title = project.css("h2.bbcard_name strong a").text
  	projects[title.to_sym] = {
  		:image_link => project.css(".project-thumbnail a img")[0]['src'],
  		:description => project.css(".bbcard_blurb").text.strip,
  		:location => project.css(".location-name").text,
  		:percent_funded => project.css("ul.project-stats li.funded strong").text.gsub("%", "").to_i
  	}
  end

  projects
end

#def get_projects
	#create_project_hash.css("li.project.grid_4")

	#title: get_projects.first.css("h2.bbcard_name strong a").text
	#MY WAY:
	#image-link: get_projects.first.css(".project-thumbnail a img")[0]['src']
	#LEARN WAY:
	#image-link: get_projects.first.css(".project-thumbnail a img").attribute("src").value
	#description: get_projects.first.css(".bbcard_blurb").text.strip
	#location: get_projects.first.css(".location-name").text
	#percent_funded: get_projects.first.css("ul.project-stats li.funded strong").text.gsub("%", "").to_i
#end


