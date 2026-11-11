abstract class ProductStates {}

class ProductLoading extends ProductStates {}

class ProductSuccess extends ProductStates {
  final List products;

  ProductSuccess(this.products);
}

class ProductFailure extends ProductStates {
  
}
