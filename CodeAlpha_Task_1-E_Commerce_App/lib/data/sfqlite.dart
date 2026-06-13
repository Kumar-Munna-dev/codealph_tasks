import 'package:sqlite3/sqlite3.dart';

class DatabaseService {
  late Database db;

  void init() {
    db = sqlite3.open('shop.db');

    // Products
    db.execute('''
      CREATE TABLE IF NOT EXISTS products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        price REAL,
        category TEXT,
        description TEXT,
        sellerName TEXT
      )
    ''');

    // Images
    db.execute('''
      CREATE TABLE IF NOT EXISTS product_images(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        image TEXT
      )
    ''');

    // Ratings
    db.execute('''
      CREATE TABLE IF NOT EXISTS product_ratings(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        userName TEXT,
        star INTEGER,
        review TEXT
      )
    ''');
  }

  // Add Product
  int addProduct({
    required String title,
    required double price,
    required String category,
    required String description,
    required String sellerName,
  }) {
    db.execute(
      '''
      INSERT INTO products(
        title,
        price,
        category,
        description,
        sellerName
      )
      VALUES(?,?,?,?,?)
      ''',
      [
        title,
        price,
        category,
        description,
        sellerName,
      ],
    );

    final result =
        db.select('SELECT last_insert_rowid() as id');

    return result.first['id'] as int;
  }

  // Add Image
  void addImage(
    int productId,
    String image,
  ) {
    db.execute(
      '''
      INSERT INTO product_images(
        productId,
        image
      )
      VALUES(?,?)
      ''',
      [
        productId,
        image,
      ],
    );
  }

  // Add Rating
  void addRating({
    required int productId,
    required String userName,
    required int star,
    required String review,
  }) {
    db.execute(
      '''
      INSERT INTO product_ratings(
        productId,
        userName,
        star,
        review
      )
      VALUES(?,?,?,?)
      ''',
      [
        productId,
        userName,
        star,
        review,
      ],
    );
  }

  // Get Product
  void getProduct(int productId) {
    final product = db.select(
      '''
      SELECT *
      FROM products
      WHERE id = ?
      ''',
      [productId],
    );

    final images = db.select(
      '''
      SELECT *
      FROM product_images
      WHERE productId = ?
      ''',
      [productId],
    );

    final ratings = db.select(
      '''
      SELECT *
      FROM product_ratings
      WHERE productId = ?
      ''',
      [productId],
    );
  }

  void close() {
    db.dispose();
  }
}