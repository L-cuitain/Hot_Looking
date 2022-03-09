const router = require('koa-router')();
const {
    getNewsContent ,
    getComment ,
    getHotArticles,
    getArticleContent,
    getAComment,
    getVideosContent,
    getVComment
} = require("../controllers/detailController");

router.prefix('/detail');

//根据资讯id查看资讯内容
router.get('/content',getNewsContent);

//获取本周最热文章
router.get('/week',getHotArticles);

//获取资讯评论
router.get('/comment',getComment);

//获取文章内容
router.get('/article',getArticleContent);

//获取文章评论
router.get('/article/comment',getAComment);

//获取视频内容
router.get('/video',getVideosContent);

//获取视频评论
router.get('/video/comment',getVComment);

module.exports = router;