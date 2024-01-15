/*import 'package:flutter/material.dart';
import 'product_model.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: ProductListingPage(),
      ),
    );
  }
}

class ProductListingPage extends StatelessWidget {
  final List<Product> products = [
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductRow(product: product);
        },
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final Product product;

  const ProductRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(product.imageUrl),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toString()}'),
      trailing: CartActionButton(product: product),
    );
  }
}

class CartActionButton extends StatelessWidget {
  final Product product;

  const CartActionButton({required this.product});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return IconButton(
      icon: cartProvider.cartItems.contains(product)
          ? Icon(Icons.done)
          : Icon(Icons.add_shopping_cart),
      onPressed: () {
        if (cartProvider.cartItems.contains(product)) {
          cartProvider.removeFromCart(product);
        } else {
          cartProvider.addToCart(product);
        }
      },
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          Product product = cartProvider.cartItems[index];
          return ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total: \$${totalPrice.toString()}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                  Navigator.pop(context);
                },
                child: Text('BUY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

// main.dart
/*import 'package:flutter/material.dart';
import 'product_model.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductListingPage(),
      ),
    );
  }
}

class ProductListingPage extends StatelessWidget {
  final List<Product> products = [
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),
    Product(imageUrl: 'assets/product1.jpg', name: 'Product 1', price: 20.0),

    // Add more products...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductRow(product: product);
        },
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final Product product;

  const ProductRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          bool isInCart = cartProvider.cartItems.contains(product);

          return ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '\$${product.price.toString()}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            trailing: IconButton(
              icon: isInCart
                  ? Icon(Icons.done, color: Colors.green)
                  : Icon(Icons.add_shopping_cart),
              onPressed: () {
                if (isInCart) {
                  cartProvider.removeFromCart(product);
                } else {
                  cartProvider.addToCart(product);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class CartActionButton extends StatelessWidget {
  final Product product;

  const CartActionButton({required this.product});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return IconButton(
      icon: cartProvider.cartItems.contains(product)
          ? Icon(Icons.done, color: Colors.green)
          : Icon(Icons.add_shopping_cart),
      onPressed: () {
        if (cartProvider.cartItems.contains(product)) {
          cartProvider.removeFromCart(product);
        } else {
          cartProvider.addToCart(product);
        }
      },
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.calculateTotalPrice();

    // Capture the context outside the Scaffold
    BuildContext scaffoldContext = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16), // Add padding to the container
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  Product product = cartProvider.cartItems[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${product.price.toString()}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Handle the delete button click
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                  height:
                      20), // Add some spacing between the list and total/buy
              BottomAppBar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toString()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the BUY button click
                          cartProvider.clearCart();
                          Navigator.pop(scaffoldContext);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: Text(
                          'BUY',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'product_model.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductListingPage(),
      ),
    );
  }
}

class ProductListingPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        imageUrl: 'assets/c-d-x-PDX_a_82obo-unsplash.jpg',
        name: 'Product 1',
        price: 20.0),
    Product(
        imageUrl: 'assets/annie-spratt-fbAnIjhrOL4-unsplash.jpg',
        name: 'Product 2',
        price: 25.0),
    Product(
        imageUrl: 'assets/diego-ph-fIq0tET6llw-unsplash.jpg',
        name: 'Product 3',
        price: 30.0),
    Product(
        imageUrl: 'assets/florian-klauer-mk7D-4UCfmg-unsplash.jpg',
        name: 'Product 4',
        price: 300.0),
    Product(
        imageUrl: 'assets/ajeet-mestry-UBhpOIHnazM-unsplash.jpg',
        name: 'Product 5',
        price: 3.0),
    Product(
        imageUrl: 'assets/insung-yoon-w2JtIQQXoRU-unsplash.jpg',
        name: 'Product 6',
        price: 230.0),
    Product(
        imageUrl: 'assets/sam-moghadam-khamseh-kvmdsTrGOBM-unsplash.jpg',
        name: 'Product 7',
        price: 20.0),
    Product(
        imageUrl: 'assets/edge2edge-media-uKlneQRwaxY-unsplash.jpg',
        name: 'Product 8',
        price: 380.0),
    Product(
        imageUrl: 'assets/thought-catalog-9aOswReDKPo-unsplash.jpg',
        name: 'Product 9',
        price: 3000.0),
    Product(
        imageUrl: 'assets/florian-klauer-nptLmg6jqDo-unsplash.jpg',
        name: 'Product 10',
        price: 80.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductRow(product: product);
        },
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final Product product;

  const ProductRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          bool isInCart = cartProvider.cartItems.contains(product);

          return ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                product.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '\$${product.price.toString()}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            trailing: IconButton(
              icon: isInCart
                  ? Icon(Icons.done, color: Colors.green)
                  : Icon(Icons.add_shopping_cart),
              onPressed: () {
                if (isInCart) {
                  cartProvider.removeFromCart(product);
                } else {
                  cartProvider.addToCart(product);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.calculateTotalPrice();

    // Capture the context outside the Scaffold
    BuildContext scaffoldContext = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  Product product = cartProvider.cartItems[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${product.price.toString()}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              BottomAppBar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toString()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cartProvider.clearCart();
                          Navigator.pop(scaffoldContext);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: Text(
                          'BUY',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
