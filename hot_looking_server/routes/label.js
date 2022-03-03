const router = require('koa-router')()

const {
    getHotNews ,
    getHotVideo ,
    getHotCollection ,
    getLabelList,
    getArticlesList,
    getNewsList,
    getVideosList
} = require("../controllers/labelController");

router.prefix('/label');

//根据标签id查询3篇最热文章
router.get('/news',getHotNews);

//根据标签id查询3篇最热视频
router.get('/videos',getHotVideo);

//根据标签id查询推荐专题
router.get('/collection',getHotCollection);

//根据标签查询对应列表
router.get('/list',getLabelList);

//根据标签id查询文章列表
router.get('/articles/list',getArticlesList);

//根据标签id查询视频列表
router.get('/videos/list',getVideosList);

//根据标签id查询资讯列表
router.get('/news/list',getNewsList);

module.exports = router