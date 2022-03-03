const router = require('koa-router')()
const { getTopNews , getHotNews , getNewsList,getNewsTotal} = require("../controllers/newsController");

router.prefix('/news');

// 查询最新资讯
router.get('/top', getTopNews);
// 查询最热资讯
router.get('/hot',getHotNews);
// 查询资讯列表
router.get('/list',getNewsList);


module.exports = router