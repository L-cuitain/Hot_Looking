const router = require('koa-router')();

const {
    getCollectionList ,
    getSpecifyCollection,
    getAllList,
    getNewsList,
    getArticlesList,
    getVideosList
} = require("../controllers/collectionsController");

router.prefix('/collections');

//查询所有专题
router.get('/list', getCollectionList);

//查询指定专题
router.get('/specify',getSpecifyCollection);

//查询专题全部详情
router.get('/all',getAllList);
//查询专题资讯详情
router.get('/news',getNewsList);
//查询专题文章详情
router.get('/articles',getArticlesList);
//查询专题视频详情
router.get('/videos',getVideosList);

module.exports = router;