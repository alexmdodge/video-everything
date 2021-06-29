#!/bin/node


const fs = require('fs')
const localIP = require('local-ip')('en0');

console.log(`Using Content IP address: ${localIP}`)

const contentJsonFile = "./src/assets/data/content.json";

const contentData = { ipAddress: localIP };

fs.writeFile(contentJsonFile, JSON.stringify(contentData), 'utf8', function (err) {
  if (err) return console.log(err);
});
