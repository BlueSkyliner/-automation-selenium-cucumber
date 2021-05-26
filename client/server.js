const { createServer } = require("https");
const { parse } = require("url");
const { readFileSync } = require("fs");
const next = require("next");

const port = 3000;
const dev = process.env.NODE_ENV !== "production";
const app = next({ dev });
const handle = app.getRequestHand