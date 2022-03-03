const router = require('koa-router')()
const { getAVList } = require("../controllers/topController");

router.prefix('/top');

// 查询资讯列表
router.get('/list',getAVList);

module.exports = router