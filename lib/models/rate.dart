class Rate {
  DateTime startDate;
  DateTime? endDate; // Nullable DateTime for "until current"
  double rateAmount;

  Rate({
    required this.startDate,
    this.endDate, // Optional endDate
    required this.rateAmount,
  });

  // Optional: Add methods for convenience
  bool isActive(DateTime date) {
    if (endDate == null) {
      return date.isAtSameMomentAs(startDate) || date.isAfter(startDate);
    } else {
      return (date.isAtSameMomentAs(startDate) || date.isAfter(startDate)) &&
          (date.isAtSameMomentAs(endDate!) || date.isBefore(endDate!));
    }
  }

  @override
  String toString() {
    return 'Rate{startDate: $startDate, endDate: $endDate, rateAmount: $rateAmount}';
  }
}
