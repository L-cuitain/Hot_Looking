const router = require('koa-router')()
const { getVideosList } = require("../controllers/videosController");

router.prefix('/videos');

// 查询资讯列表
router.get('/list',getVideosList);

module.exports = router