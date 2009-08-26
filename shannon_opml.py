import urllib

job_titles = """Marketing Manager
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
Web Marketing Manager"""


urls = []

def term_to_urls(job_title):
    # encode job title
    jt = urllib.quote_plus(job_title)
    urls.append('http://charlotte.craigslist.org/search/mar?query=' + jt + '&format=rss')
    urls.append('http://www.simplyhired.com/a/job-feed/rss/q-' + jt + '/l-Charlotte%2C+NC')
    return urls

for job_title in job_titles.split('\n'):
    term_to_urls(job_title)
    for u in urls:
        print u
    
