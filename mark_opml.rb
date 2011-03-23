#!/usr/bin/env ruby

require 'rubygems'
require 'cgi'
require 'builder'

jobtitles = <<JOBTITLES
Vice President, Internal Audit
Internal Audit Vice President
Internal Audit Executive
Executive Vice President, Internal Audit
Chief Audit Executive
Chief Auditor
Director Internal Audit
Internal Audit Director
Financial Audit Director
Healthcare Internal Audit Director
Assistant Vice President, Internal Audit
JOBTITLES

links = ""
opml = ""

# from http://github.com/jes5199/free_my_livejounal_with_opml/blob/ff0fdc675c469f1886cf59b7b99d2d3fd3cc921f/friends.rb
xml = Builder::XmlMarkup.new(:target => opml, :indent => 1)
xml.instruct!
xml.opml(:version => "1.0") do
    xml.head do
        xml.title("Mark Jenkins - Job Search Subscriptions in Google Reader")
    end
    xml.body do
    jobtitles.each do |t|
        title = t.chomp
        cl_url = "http://nashville.craigslist.org/search/acc?query=#{CGI.escape title}&format=rss"
        sh_url = "http://www.simplyhired.com/a/job-feed/rss/q-#{CGI.escape title}/l-Nashville%2C+TN"
        cj_url = "http://www.careerjet.com/search/rss.html?s=#{CGI.escape title}&l=Nashville%2C+TN"
        indeed_url = "http://rss.indeed.com/rss?q=#{CGI.escape title}&l=Nashville%2C+TN"
        links += [title, cl_url, sh_url, cj_url, indeed_url].join("\n") + "\n\n"
        xml.outline(:text => "#{title} - Nashville Craigslist",
                    :title => "#{title} - Nashville Craigslist",
                    :type => "rss", :xmlUrl => cl_url, :htmlUrl => cl_url)
        xml.outline(:text => "#{title} - Nashville SimplyHired",
                    :title => "#{title} - Nashville SimplyHired",
                    :type => "rss", :xmlUrl => sh_url, :htmlUrl => sh_url)
        xml.outline(:text => "#{title} - Nashville Careerjet",
                    :title => "#{title} - Nashville Careerjet",
                    :type => "rss", :xmlUrl => cj_url, :htmlUrl => cj_url)
        xml.outline(:text => "#{title} - Nashville Indeed",
                    :title => "#{title} - Nashville Indeed",
                    :type => "rss", :xmlUrl => indeed_url, :htmlUrl => indeed_url)
    end
  end
end

File.open("mark_jenkins.opml", 'w') {|f| f.write(opml) }
File.open("mark_jenkins.txt", 'w') {|f| f.write(links) }
