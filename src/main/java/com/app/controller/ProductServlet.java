package com.app.controller;

import com.app.model.Category;
import com.app.model.Product;
import com.app.service.categoryservice.CategoryService;
import com.app.service.categoryservice.ICategoryService;
import com.app.service.productservice.IProductService;
import com.app.service.productservice.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/home")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(req,resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "delete":
                deleteProduct(req,resp);
                break;
            default:
                showAllProduct(req,resp);
                break;
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(req,resp);
                break;
            case "edit":
                editProduct(req,resp);
                break;
            case "delete":
                break;
        }
    }
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            List<Category> categoryList = categoryService.findAll();
            req.setAttribute("product",product);
            req.setAttribute("categoryList",categoryList);
            RequestDispatcher rd = req.getRequestDispatcher("/product/editProduct.jsp");
            rd.forward(req,resp);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void editProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            Double price = Double.parseDouble(req.getParameter("price"));
            int  amount = Integer.parseInt(req.getParameter("amount"));
            String color = req.getParameter("color");
            String description = req.getParameter("description");
            int category_id = Integer.parseInt(req.getParameter("category_id"));
            Category category = new Category(category_id);
            Product product = new Product(id,name,price,amount,color,description,category);
            productService.edit(id,product);
            resp.sendRedirect("/home");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            productService.delete(id);
            resp.sendRedirect("/home");
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
    private void showAllProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Product> productList = productService.findAll();
            req.setAttribute("productList",productList);
            RequestDispatcher rd = req.getRequestDispatcher("/product/listP.jsp");
            rd.forward(req,resp);
        }  catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("categoryList",categoryList);
        RequestDispatcher rd = req.getRequestDispatcher("/product/createProduct.jsp");
        try {
            rd.forward(req,resp);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void createProduct(HttpServletRequest req, HttpServletResponse resp)  {
        try {
            String name = req.getParameter("name");
            double  price = Double.parseDouble(req.getParameter("price"));
            int  amount = Integer.parseInt(req.getParameter("amount"));
            String color = req.getParameter("color");
            String description = req.getParameter("description");
            int category_id = Integer.parseInt(req.getParameter("category_id"));
            Category category = new Category(category_id);
            Product product = new Product(name,price,amount,color,description,category);
            System.out.println(product);
            productService.save(product);
            resp.sendRedirect("/product/listP.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
