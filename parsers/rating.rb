json = JSON.parse(content)

vars = page['vars']
review_summary = json['reviewSummary']
reviews = nil

if review_summary['numReviews'] > 0
    reviews = {
        num_total_reviews: review_summary['numReviews'],
        avg_rating: review_summary['primaryRating']['average']
    }.to_json
end

outputs << {
    _collection: "rating",
    _id: vars['productId']
    reviews: reviews
}