
const toggleStarsInBlack = (rating) => {
  for (let i = 1; i <= 5; i++) {
    const star = document.getElementById(i);
    if (i <= rating) {
      star.className = "review-rating fas fa-star"
    } else {
      star.className = "review-rating far fa-star"
    }
  }
};

const updateRatingInput = (rating) => {
  const formInput = document.getElementById('review_rating')
  formInput.value = rating
}

const dynamicRating = () => {
  const stars = document.querySelectorAll('.review-rating');
  if ( stars.length > 0) {
    stars.forEach((star) => {
      star.addEventListener("click", (event) => {
        const rating = event.currentTarget.id
        toggleStarsInBlack(rating);
        updateRatingInput(rating);
      });
    });
  };
};

export { dynamicRating };
