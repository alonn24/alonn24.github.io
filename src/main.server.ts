import { environment } from './environments/environment';
import { enableProdMode } from '@angular/core';

if (environment.production) {
  enableProdMode();
}

// export { AppServerModule } from './app/app.server.module';
import { AppServerModule } from './app/app.server.module';


// server
import 'zone.js/dist/zone-node';
import 'reflect-metadata';
import * as express from 'express';
// import * as fs from 'fs';

// import { platformServer, renderModuleFactory } from '@angular/platform-server';
import { ngExpressEngine } from '@nguniversal/express-engine';

const app = express();
const port = 8000;
const baseUrl = `http://localhost:${port}`;


const bootstrap = () => {
  app.engine('html', ngExpressEngine({
    bootstrap: AppServerModule
  }));
  app.set('view engine', 'html');
  app.set('views', './');
  app.use('/', express.static('./', { index: false }));
  app.get('*', (req, res) => {
    res.render('index', {
      req,
      res
    });
  });
  app.listen(port, () => {
    console.log(`Listening at ${baseUrl}`);
  });
};

export { bootstrap }
