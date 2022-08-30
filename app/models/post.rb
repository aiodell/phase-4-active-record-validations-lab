class Post < ApplicationRecord

	validates :title, presence: true
	validates :content, :length => { :minimum => 250 }
	validates :summary, :length => { :maximum => 250 }
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
	validate 	:clickbait?

	# create an array for the customer validations
	# d stands for the integer
	CLICKBAIT_VALIDATIONS =
	[ 
	  /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
	]

	def clickbait?
	# Traverse the array and search for clickbait words and validate. Otherwise, show message
		if CLICKBAIT_VALIDATIONS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
