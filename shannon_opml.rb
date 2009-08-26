#!/usr/bin/env ruby

require 'rubygems'
require 'cgi'
require 'builder'

jobtitles = <<JOBTITLES
Marketing Manager
Marketing Director
Vice President of Marketing
Director of Marketing
Regional Marketing Manager
Marketing Coordinator
VP of Marketing
Dir. of Marketing
Advertising Manager
Brand Manager
Marketing Communications Manager
Manager Marketing Communications
Marketing Communications Specialist
Chief Marketing Officer
CMO
Director of Web Marketing
Director, Internet Development
Director, Web Marketing
Email Marketing Manager
Product Development Manager
Vice President, Marketing
VP Marketing and Products
Web Communications Manager
Web Marketing Manager
JOBTITLES

# from http://github.com/jes5199/free_my_livejounal_with_opml/blob/ff0fdc675c469f1886cf59b7b99d2d3fd3cc921f/friends.rb
xml = Builder::XmlMarkup.new(:target => STDOUT)
xml.instruct!
xml.opml(:version => "1.0") do
    xml.head do
        xml.title("subscriptions in Google Reader")
    end
    xml.body do
    jobtitles.each do |t|
        title = t.chomp
        cl_url = "http://charlotte.craigslist.org/search/mar?query=#{CGI.escape title}&format=rss"
        sh_url = "http://www.simplyhired.com/a/job-feed/rss/q-#{CGI.escape title}/l-Charlotte%2C+NC"
        xml.outline(:text => title, :title => title, :type => "rss", :xmlUrl => cl_url, :htmlUrl => cl_url)
        xml.outline(:text => title, :title => title, :type => "rss", :xmlUrl => sh_url, :htmlUrl => sh_url)
    end
  end
end

