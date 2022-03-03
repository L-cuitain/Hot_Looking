const router = require('koa-router')()
const { getArticlesList } = require("../controllers/articlesController");

router.prefix('/articles');

// 查询资讯列表
router.get('/list',getArticlesList);

module.exports = router

