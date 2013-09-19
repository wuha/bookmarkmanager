#encoding utf-8
module BookmarksHelper

	def back_to_list
	
		content_tag(:p,
								link_to("Zurueck zur Liste", bookmarks_path),
								class: "subNavigation")
	
	end

end
