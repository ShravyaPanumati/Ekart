package com.groupd.service;

import java.math.BigDecimal;
import java.util.Map;

import com.groupd.exception.NotEnoughProductsInStockException;
import com.groupd.model.Product;

public interface ShoppingCartService {

    void addProduct(Product product);

    void removeProduct(Product product);

    Map<Product, Integer> getProductsInCart();

    void checkout() throws NotEnoughProductsInStockException;

    BigDecimal getTotal();
}
