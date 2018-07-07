const fs = require('fs');
const path = require('path');
const express = require('express');
const vueServerRenderer = require('vue-server-renderer');

const app = express();

// Server-Side Bundle File
const serverBundleFilePath = path.join(__dirname, '../build/bundle.server.js');
const serverBundleFileCode = fs.readFileSync(serverBundleFilePath, 'utf8');
const bundleRenderer = vueServerRenderer.createBundleRenderer(serverBundleFileCode);

// Client-Side Bundle File
const clientBundleFileUrl = '/bundle.client.js';
const clientStyleCheet = '/bundle.css';

// Server-Side Rendering
app.get('/', function (req, res) {
  bundleRenderer.renderToString((err, html) => {
    if (err){
      res.status(500).send(`
        <h1>Error: ${err.message}</h1>
        <pre>${err.stack}</pre>
      `);
    } else {
      res.send(`
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset="utf-8">
            <title>Vue 2.0 SSR</title>
            <link href="${clientStyleCheet}" rel="stylesheet">
          </head>
          <body>
            ${html}
            <script src="${clientBundleFileUrl}"></script>
          </body>
        </html>`);
    }
  });
});

app.get('/data', function (req, res) {
  function randNum() {
    return Math.round(Math.random() * 100);
  }
  res.send({
    name: `Hans-${randNum()}`,
    age: randNum(),
  });
});

app.use(express.static(__dirname + '/../build/public'));

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, function () {
  console.log(`Example app listening on port ${PORT}!`);
});
