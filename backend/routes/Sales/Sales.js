const express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');

// MySQL connection
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'anubroker'
});

// Endpoint to fetch sales data
router.get('/', async (req, res) => {
    const { start_date, end_date, limit = 25, offset = 0 } = req.query; // Get date parameters from query

    // Validate limit
    if (limit < 1 || limit > 100) {
        return res.status(400).json({ error: "Limit must be between 1 and 100" });
    }

    try {
        const transactionsQuery = `
            SELECT 
                i.id AS invoice_id,
                u.fullName AS customer_name,
                i.invoice_date AS date_purchase,
                i.due_date,
                p.product_name AS product_name,  
                ii.quantity,
                ii.line_total AS sale_total,
                ar.paid_amount,
                (ar.total_amount - ar.paid_amount) AS outstanding_balance
            FROM 
                invoices i
            JOIN 
                users u ON i.user_id = u.id
            JOIN 
                invoice_items ii ON i.id = ii.invoice_id
            JOIN 
                products p ON ii.product_id = p.product_id
            LEFT JOIN 
                accounts_receivable ar ON i.id = ar.invoice_id
            WHERE 
                ar.invoice_id IS NOT NULL 
                AND (i.invoice_date BETWEEN ? AND ?)
            LIMIT ? OFFSET ?;`;

        // Execute the query
        const [salesData] = await db.query(transactionsQuery, [
            start_date || '1970-01-01', // Default to a far past date if no start date
            end_date || '9999-12-31',   // Default to a far future date if no end date
            Number(limit),               // Convert limit to a number
            Number(offset)               // Convert offset to a number
        ]);

        // Check if sales data is empty
        if (salesData.length === 0) {
            return res.status(404).json({ message: "No sales data found for the specified date range." });
        }

        console.log(salesData); // Log sales data for debugging
        res.json(salesData); // Return valid JSON
    } catch (error) {
        console.error("Error fetching sales data:", error); // Log full error message
        res.status(500).json({ error: "Server error", details: error.message }); // Return JSON error response with details
    }
});

module.exports = router;
