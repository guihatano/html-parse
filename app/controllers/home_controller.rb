class HomeController < ApplicationController
	require 'open-uri'

	def index
		doc = Nokogiri::HTML(open("http://aalmiray.github.io/ikonli/cheat-sheet-ionicons.html"))

		trs = doc.css("tbody tr")

		@array = []

		trs.each do |tr|
			# if we want to get the id to save on a db
			# tr.css("td:first-child")
			# in case of get id, we can use an array of arrays

			# just the name
			icon_name = tr.css("td:nth-child(3)").text
			@array.push(icon_name)
		end

	end
end
