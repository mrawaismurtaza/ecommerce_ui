class Categories {
  final String slug;
  final String name;
  final String url;

  Categories({
    required this.slug,
    required this.name,
    required this.url,
  });

  factory Categories.fromString(String categoryName) {
    // Clean the category name - remove any extra formatting
    String cleanName = categoryName.trim();
    
    // Map category names to actual online images
    Map<String, String> categoryImages = {
      'beauty': 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=300&h=300&fit=crop',
      'fragrances': 'https://images.unsplash.com/photo-1541643600914-78b084683601?w=300&h=300&fit=crop',
      'furniture': 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=300&h=300&fit=crop',
      'groceries': 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=300&h=300&fit=crop',
      'home-decoration': 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=300&h=300&fit=crop',
      'kitchen-accessories': 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=300&h=300&fit=crop',
      'laptops': 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300&h=300&fit=crop',
      'mens-shirts': 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=300&h=300&fit=crop',
      'mens-shoes': 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=300&h=300&fit=crop',
      'mens-watches': 'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=300&h=300&fit=crop',
      'mobile-accessories': 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=300&h=300&fit=crop',
      'motorcycle': 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=300&h=300&fit=crop',
      'skin-care': 'https://images.unsplash.com/photo-1556228453-efd6c1ff04f6?w=300&h=300&fit=crop',
      'smartphones': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300&h=300&fit=crop',
      'sports-accessories': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=300&h=300&fit=crop',
      'sunglasses': 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=300&h=300&fit=crop',
      'tablets': 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=300&h=300&fit=crop',
      'tops': 'https://images.unsplash.com/photo-1485968579580-b6d095142e6e?w=300&h=300&fit=crop',
      'vehicle': 'https://images.unsplash.com/photo-1549317336-206569e8475c?w=300&h=300&fit=crop',
      'womens-bags': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300&h=300&fit=crop',
      'womens-dresses': 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=300&h=300&fit=crop',
      'womens-jewellery': 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=300&h=300&fit=crop',
      'womens-shoes': 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=300&h=300&fit=crop',
      'womens-watches': 'https://images.unsplash.com/photo-1523170335258-f5c6c6bd6eaf?w=300&h=300&fit=crop',
    };

    String slug = cleanName.toLowerCase().replaceAll(' ', '-');
    String imageUrl = categoryImages[slug] ?? 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=300&h=300&fit=crop';
    
    // Capitalize first letter of each word for display
    String displayName = cleanName.split(' ')
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
        .join(' ');
    
    return Categories(
      slug: slug,
      name: displayName,
      url: imageUrl,
    );
  }
}