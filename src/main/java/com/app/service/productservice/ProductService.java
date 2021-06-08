package com.app.service.productservice;

import com.app.config.ConnectionJDBC;
import com.app.model.Category;
import com.app.model.Product;
import com.app.service.categoryservice.CategoryService;
import com.app.service.categoryservice.ICategoryService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private final String SELECT_ALL_PRODUCT = "select * from product";
    private final String SELECT_BY_ID = "select * from product where id = ?";
    private final String SAVE_PRODUCT = "insert into product(name,price,amount,color,description,category_id) values(?,?,?,?,?,?)";
    private final String DELETE_PRODUCT = "delete from product where id = ?";
    private final String UPDATE_PRODUCT = "update product set name = ?, price = ?, amount = ?,color = ?,description = ?, category_id = ? where id = ?;";
    private Connection connection = ConnectionJDBC.getConnection();
    private ICategoryService categoryService = new CategoryService();
    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int amount = resultSet.getInt("amount");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("c_id");
                Category category = categoryService.findById(category_id);
                Product product = new Product(id,name,price,amount,color,description,category);
                productList.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    return productList;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id_product = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int amount = resultSet.getInt("amount");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("c_id_id");
                Category category = categoryService.findById(category_id);
                product = new Product(id_product,name,price,amount,color,description,category);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    @Override
    public void save(Product p) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SAVE_PRODUCT);
            preparedStatement.setString(1,p.getName());
            preparedStatement.setDouble(2,p.getPrice());
            preparedStatement.setInt(3,p.getAmount());
            preparedStatement.setString(4,p.getColor());
            preparedStatement.setString(5,p.getDescription());
            preparedStatement.setInt(6,p.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(int id, Product product) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getAmount());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getCategory().getId());
            preparedStatement.setInt(7, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement  = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    @Override
    public String toString() {
        return "ProductService{" +
                "SELECT_ALL_PRODUCT='" + SELECT_ALL_PRODUCT + '\'' +
                ", SELECT_BY_ID='" + SELECT_BY_ID + '\'' +
                ", SAVE_PRODUCT='" + SAVE_PRODUCT + '\'' +
                ", connection=" + connection +
                ", categoryService=" + categoryService +
                '}';
    }
}
