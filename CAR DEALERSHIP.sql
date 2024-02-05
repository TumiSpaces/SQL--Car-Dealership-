USE cars;
-- READ DATA --
SELECT *
FROM cars;
 
-- TOTAL CARS: get a COUNT of total records--
 SELECT COUNT(*) AS TotalCars
FROM cars;

-- Manager asked the employee, how many cars will be availabe in 2023? --
SELECT COUNT(*) AS CarsAvailableIn2023
FROM cars
WHERE year = 2023;

-- Manager asked the employee, How many cars were available in 2020,2021 and 2022/? --
SELECT year, COUNT(*) AS CarsAvailable
FROM cars
WHERE year IN (2020, 2021, 2022)
GROUP BY year;

-- Client asked to print the total of all cars by year, client wanted to see all the details --
SELECT year, COUNT(*) AS TotalCars,
       Name, selling_price, km_driven, fuel, seller_type,
       transmission, owner, mileage, engin, max_power, torque, seats
FROM cars
GROUP BY year, name, selling_price, km_driven, fuel, seller_type,
         transmission, owner, mileage, engin, max_power, torque, seats
ORDER BY year;

-- Client asked the sales agent, how many diesel cars will be available in 2020 --
SELECT COUNT(*) AS DieselCarsAvailableIn2020
FROM cars
WHERE year = 2020
AND fuel = 'diesel';

-- Client asked the sales agent, how many petrol cars will be available in 2020 --
SELECT COUNT(*) AS PetrolCarsAvailableIn2020
FROM cars
WHERE year = 2020
AND fuel = 'petrol';

-- What are total sales of Diesel cars? --
SELECT SUM(selling_price) AS TotalDieselCarSales
FROM cars
WHERE fuel = 'diesel';

-- What are total sales of Diesel cars? --
SELECT SUM(selling_price) AS TotalPetrolCarSales
FROM cars
WHERE fuel = 'petrol';

-- Which Car type sells the most--
SELECT fuel AS CarType, COUNT(*) AS TotalSales
FROM cars
GROUP BY fuel
ORDER BY TotalSales DESC;

-- TRENT ANALYSIS --

-- Manager asked how has the number of cars available changed over the years> --
SELECT year, COUNT(*) AS TotalCars
FROM cars
GROUP BY year
ORDER BY year;

-- Are there any noticeable trends in the selling prices of cars over time? --
SELECT year, AVG(selling_price) AS AvgSellingPrice
FROM cars
GROUP BY year
ORDER BY year;

-- SEGMENTATION --

-- MANAGER asked can you categorize cars based on their fuel type, transmission type, or seller type? --

SELECT fuel, COUNT(*) AS TotalCars
FROM cars
GROUP BY fuel;

-- Manager asked can you categorize cars based on their fuel type, transmission type, or seller type? --
-- Categorizing by Fuel Type: --
SELECT fuel, AVG(selling_price) AS AvgSellingPrice, MIN(selling_price) AS MinSellingPrice, MAX(selling_price) AS MaxSellingPrice
FROM cars
GROUP BY fuel;

-- Categorizing by Transmission Type: --
SELECT transmission, COUNT(*) AS TotalCars
FROM cars
GROUP BY transmission;

-- Catergorizing by Selling Prices by Seller Type --
SELECT transmission, COUNT(*) AS TotalCars
FROM cars
GROUP BY transmission;

-- PERFOMANCE METRIX --
-- What is the average mileage (fuel efficiency) of cars in the dataset? -- 
SELECT AVG(mileage) AS AverageMileage
FROM cars;

-- Which car has the highest and lowest mileage? --
-- highest mileage --
SELECT Name, mileage
FROM cars
ORDER BY mileage DESC
LIMIT 1;

-- lowest mileage --
SELECT Name, mileage
FROM cars
ORDER BY mileage ASC
LIMIT 1;

-- What is the average selling price of cars in the dataset? --
SELECT AVG(selling_price) AS AverageSellingPrice
FROM cars;

-- MARKET ANALYSIS--
-- What are the most common car brands/models in the dataset? --
SELECT Name, COUNT(*) AS Frequency
FROM cars
GROUP BY Name
ORDER BY Frequency DESC;

-- Which brands/models have the highest selling prices?-- 
SELECT Name, MAX(selling_price) AS MaxSellingPrice
FROM cars
GROUP BY Name
ORDER BY MaxSellingPrice DESC;

-- CUSTOMER PREFERENCE -- 
-- Do customers prefer cars with manual or automatic transmission? --
SELECT transmission, COUNT(*) AS TotalCars
FROM cars
GROUP BY transmission;

-- Are there any patterns in terms of preferred fuel type or seller type?--
SELECT fuel, COUNT(*) AS TotalCars
FROM cars
GROUP BY fuel;

SELECT seller_type, COUNT(*) AS TotalCars
FROM cars
GROUP BY seller_type;

-- Do certain features (e.g., number of seats, engine power) influence customer choices?-- 
SELECT seats, AVG(selling_price) AS AvgSellingPrice
FROM cars
GROUP BY seats;

-- GEOGRAPHICAL ANALYSIS --
-- Are there any regional differences in terms of the types of cars available or their selling prices?
SELECT region, COUNT(*) AS TotalListings, AVG(selling_price) AS AvgSellingPrice
FROM cars
GROUP BY region;

-- Can you identify regions where certain car types are more popular?
SELECT region, fuel, COUNT(*) AS TotalListings
FROM cars
GROUP BY region, fuel;



























