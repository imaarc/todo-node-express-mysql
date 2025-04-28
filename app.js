const express = require('express');
const connection = require('./db');
const app = express();

app.use(express.json());

app.post('/addTodo', (req, res) => {
    const { title, description } = req.body;
    const sql = 'INSERT INTO todo (title, description) VALUES (?, ?)';
    connection.query(sql, [title, description], (err, result) => {
        if (err) {
            console.error('Error adding todo:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.status(201).json({ message: 'Todo added successfully', id: result.insertId });
    });
});

app.get('/getTodos', (req, res) => {
    const sql = 'SELECT * FROM todo where isAcitve = 1 ';
    connection.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching todos:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.status(200).json(results);
    });
});

app.get('/getTodo/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'SELECT * FROM todo WHERE id = ?';
    connection.query(sql, [id], (err, results) => {
        if (err) {
            console.error('Error fetching todo:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'Todo not found' });
        }
        res.status(200).json(results[0]);
    });
});

app.put('/updateTodo/:id', (req, res) => {
    const { id } = req.params;
    const { title, description } = req.body;
    const sql = 'UPDATE todo SET title = ?, description = ? WHERE id = ?';
    connection.query(sql, [title, description, id], (err, result) => {
        if (err) {
            console.error('Error updating todo:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Todo not found' });
        }
        res.status(200).json({ message: 'Todo updated successfully' });
    });
});

app.delete('/deleteTodo/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'UPDATE set  isActive = 0 WHERE id = ?';
    connection.query(sql, [id], (err, result) => {
        if (err) {
            console.error('Error deleting todo:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Todo not found' });
        }
        res.status(200).json({ message: 'Todo deleted successfully' });
    });
})

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
// This code sets up an Express server with routes to add, get, update, and delete todos from a MySQL database. It uses the mysql2 library to interact with the database and handles errors appropriately.