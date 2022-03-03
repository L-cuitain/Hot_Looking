const router = require('koa-router')();

const { getCollectionList } = require("../controllers/collectionsController");

router.prefix('/collections');

//查询所有专题
router.get('/list', getCollectionList);

module.exports = router;