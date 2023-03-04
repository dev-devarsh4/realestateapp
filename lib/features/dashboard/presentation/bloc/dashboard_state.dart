import '../../data/models/product.dart';

abstract class DashboardState {}

class InitialState extends DashboardState {}

class LoadProductState extends DashboardState {
  final List<Product> product;

  LoadProductState(this.product);
}
