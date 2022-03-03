const router = require('koa-router')()

router.prefix('/app')

const { getLabelAll } = require("../controllers/appController");

router.get('/label', getLabelAll);

module.exports = router
