const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// In-memory store for accounts
const accounts = [];

// POST endpoint to receive and save account data
app.post('/', (req, res) => {
  const jsonData = req.body;

  // Validate the structure of the JSON data
  if (jsonData && jsonData.accounts && Array.isArray(jsonData.accounts) && jsonData.timestamp) {
    jsonData.accounts.forEach(account => {
      // Simple validation (optional)
      if (account.name && account.password && account.mail && typeof account.quest === 'boolean') {
        accounts.push(account);
        console.log('Account saved:', account);
      } else {
        console.log('Invalid account data:', account);
      }
    });

    res.status(200).send('Data received and processed');
  } else {
    res.status(400).send('Invalid data format');
  }
});

// GET endpoint to retrieve all accounts (for testing purposes)
app.get('/', (req, res) => {
  res.json(accounts);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
