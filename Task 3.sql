CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Password VARCHAR(255) NOT NULL,
  Address VARCHAR(200) NOT NULL,
  City VARCHAR(50) NOT NULL,
  State VARCHAR(50) NOT NULL,
  Pincode INT NOT NULL,
  Phone VARCHAR(20) NOT NULL
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Password, Address, City, State, Pincode, Phone)
VALUES
  (1, 'Rahul', 'Sharma', 'rahul.sharma@example.com', 'password123', '123, Main St', 'Delhi', 'Delhi', 110001, '9999999999'),
  (2, 'Priya', 'Gupta', 'priya.gupta@example.com', 'password123', '456, Sector 11', 'Noida', 'Uttar Pradesh', 201301, '8888888888'),
  (3, 'Kunal', 'Jain', 'kunal.jain@example.com', 'password123', '789, MG Road', 'Gurgaon', 'Haryana', 122002, '7777777777');
SELECT * FROM Customers;

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  Description VARCHAR(200) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  StockQuantity INT NOT NULL,
  Category VARCHAR(50) NOT NULL
);



INSERT INTO Product (ProductID, ProductName, Description, Price, StockQuantity, Category)
VALUES
  (1, 'Samsung Galaxy S22', 'Latest flagship smartphone from Samsung', 79999.00, 10, 'Electronics'),
  (2, 'Nike Air Force 1', 'Stylish and comfortable sneakers from Nike', 8999.00, 20, 'Footwear'),
  (3, 'HP Envy x360 Laptop', 'Powerful and portable laptop from HP', 64999.00, 5, 'Electronics'),
  (4, 'Levi''s Jeans', 'Classic and stylish jeans from Levi''s', 2999.00, 30, 'Clothing');

SELECT * FROM Product;

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT NOT NULL,
  OrderDate DATE NOT NULL,
  TotalAmount DECIMAL(10, 2) NOT NULL,
  Status VARCHAR(50) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES
  (1, 1, '2022-01-01', 159998.00, 'Pending'),
  (2, 2, '2022-01-05', 8999.00, 'Shipped'),
  (3, 3, '2022-01-10', 64999.00, 'Delivered');
SELECT * FROM Orders ;

CREATE TABLE OrderItems (
  OrderItemID INT PRIMARY KEY,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  UnitPrice DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
  (1, 1, 1, 1, 79999.00),
  (2, 1, 2, 2, 8999.00),
  (3, 2, 3, 1, 64999.00),
  (4, 3, 4, 3, 2999.00);
SELECT * FROM OrderItems ;