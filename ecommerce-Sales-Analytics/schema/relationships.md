# Database Relationships

## Overview

The database follows a transactional e-commerce model where customers place orders, orders contain products, sellers fulfill products, and customers provide reviews and payments.

---

## Table Relationships

### Customers → Orders

customers.customer_id
→ orders.customer_id

Relationship Type:
One Customer → Many Orders

---

### Orders → Order Items

orders.order_id
→ order_items.order_id

Relationship Type:
One Order → Many Order Items

---

### Products → Order Items

products.product_id
→ order_items.product_id

Relationship Type:
One Product → Many Order Items

---

### Sellers → Order Items

sellers.seller_id
→ order_items.seller_id

Relationship Type:
One Seller → Many Order Items

---

### Orders → Payments

orders.order_id
→ order_payments.order_id

Relationship Type:
One Order → One or Many Payments

---

### Orders → Reviews

orders.order_id
→ order_reviews.order_id

Relationship Type:
One Order → One Review

---

## Relationship Diagram (Text)

customers
│
└── orders
│
├── order_items
│ ├── products
│ └── sellers
│
├── order_payments
│
└── order_reviews

---

## Business Flow

Customer places an order

Order contains one or more products

Products are supplied by sellers

Customer pays for the order

Customer submits a review

Business analyzes sales and revenue using transactional data
