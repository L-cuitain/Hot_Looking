const Koa = require('koa')
const app = new Koa()
const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
const logger = require('koa-logger')

const index = require('./routes/index');
const users = require('./routes/users');
const home = require('./routes/home');
const news = require('./routes/news');
const collections = require('./routes/collections');
const articles = require('./routes/articles');
const videos = require('./routes/videos');
const top = require('./routes/top');
const label = require('./routes/label');
const detail = require('./routes/detail');

//跨域
const cors = require('koa2-cors');

app.use(cors());

// error handler
onerror(app)

// middlewares
app.use(bodyparser({
  enableTypes:['json', 'form', 'text']
}))
app.use(json())
app.use(logger())
app.use(require('koa-static')(__dirname + '/public'))

app.use(views(__dirname + '/views', {
  extension: 'pug'
}))

// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// routes
app.use(index.routes(), index.allowedMethods())
app.use(users.routes(), users.allowedMethods())
app.use(home.routes(), home.allowedMethods())
app.use(news.routes(), news.allowedMethods())
app.use(collections.routes(), collections.allowedMethods())
app.use(articles.routes(), articles.allowedMethods())
app.use(videos.routes(), videos.allowedMethods())
app.use(top.routes(), top.allowedMethods())
app.use(label.routes(), label.allowedMethods())
app.use(detail.routes(), detail.allowedMethods())

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
});

module.exports = app
