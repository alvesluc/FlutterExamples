const jwt = require('jsonwebtoken');
const express = require('express');
const app = express();
const port = 3000;
const SECRET = '7L^w*Gqr^xzD';
const contacts = require('./contacts.json');

function checkPermission(req, res, next) {
    if (req.path !== '/login') {
        const token = req.headers['authorization'];
        if (!token) return res.status(401).send({ message: 'Token not informed' });

        jwt.verify(token, SECRET, function (err, decoded) {
            if (err) return res.status(500).send({ message: 'Access denied' });
            req.userId = decoded.id;
            next();
        });
    } else {
        next();
    }
}

app.use(express.json());
app.use(checkPermission);
app.listen(port, () => {
    console.log('Server started');
});

app.post('/login', (req, res) => {
    if (req.body.username === 'alvesluc' && req.body.password === 'lucas123') {
        const id = '1';
        const token = jwt.sign({ id }, SECRET, {
            expiresIn: 300,
        });
        res.send({ token });
    } else {
        res.status(403).send('Access denied');
    }
});

app.get('/contacts', (req, res) => {
    res.send(contacts);
});

app.get('/contacts/filter', (req, res) => {
    const queryName = req.query.name;
    const filteredContacts = contacts.filter(c => c.full_name.toLowerCase().includes(queryName.toLowerCase()));
    res.send(filteredContacts);
})