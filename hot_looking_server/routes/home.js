const router = require('koa-router')()

router.prefix('/home')

const { getCollections , getMaxNumCollection,getHotVideo , getRecommendNews , getUpNews , getUpAV, getPlayIframe} = require("../controllers/homeController");

//获取首页专题
router.get('/collections', getCollections);

//获取首页订阅数最多的专题
router.get('/rTopics',getMaxNumCollection);

//获取首页推荐视频
router.get('/hotVideo',getHotVideo);

//获取首页推荐资讯
router.get('/rNews',getRecommendNews);

//获取首页最新资讯
router.get('/uNews',getUpNews);

//获取首页最新文章和视频
router.get('/uAV',getUpAV);

//获取首页播放视频
router.get('/playVideo',getPlayIframe);

module.exports = router