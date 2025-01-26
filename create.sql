-- Создание базы данных
CREATE DATABASE Apteka;

-- Используем базу данных
USE Apteka;

-- Таблица для заказов
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Уникальный ID заказа
    customer_name VARCHAR(255) NOT NULL, -- ФИО заказчика
    order_date DATE NOT NULL             -- Дата заказа
);

-- Таблица для препаратов в аптеке
CREATE TABLE Medicines (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Уникальный ID препарата
    name VARCHAR(255) NOT NULL,              -- Название препарата
    stock_quantity INT NOT NULL,             -- Количество препарата на складе
    requires_prescription BOOLEAN NOT NULL   -- Требуется ли рецепт для препарата
);

-- Таблица для элементов заказа
CREATE TABLE Order_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Уникальный ID элемента заказа
    order_id INT NOT NULL,                   -- Связь с заказом
    medicine_id INT NOT NULL,                -- Связь с препаратом
    quantity INT NOT NULL,                   -- Количество препарата
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,       -- Внешний ключ на заказ
    FOREIGN KEY (medicine_id) REFERENCES Medicines(id) ON DELETE CASCADE  -- Внешний ключ на препарат
);

-- Таблица для рецептов заказа
CREATE TABLE Order_prescription (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Уникальный ID рецептов заказа
    order_id INT NOT NULL,                   -- Связь с заказом
    medicine_id INT NOT NULL,                -- Связь с препаратом
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,       -- Внешний ключ на заказ
    FOREIGN KEY (medicine_id) REFERENCES Medicines(id) ON DELETE CASCADE  -- Внешний ключ на препарат
);