import 'package:fruite_app/core/models/review_product_model.dart';

double getAvgRating(List<ReviewProductModel> reviews) {
  double sum = 0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
