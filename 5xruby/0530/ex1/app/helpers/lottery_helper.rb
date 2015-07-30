module LotteryHelper
	def happy
		"<li>aaaa</li>"
	end
	def happy2
		"<li>bbbb</li>".html_safe
	end
	def happy3
		content_tag :li,'bbb'
	end
end
