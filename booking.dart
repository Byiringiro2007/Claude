class Booking {
  final String id;
  final String company;
  final String from;
  final String to;
  final String date;
  final String time;
  final String seat;
  final String passenger;
  final double price;
  final String paymentMethod;

  const Booking({
    required this.id,
    required this.company,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.seat,
    required this.passenger,
    required this.price,
    required this.paymentMethod,
  });
}
