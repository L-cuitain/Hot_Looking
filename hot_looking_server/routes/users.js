const router = require('koa-router')()

const {
    userLogin ,
    userRegister ,
    getIsSubCol ,
    getAddUserCol ,
    getCancelUserCol ,
    getUserLikes ,
    getUserDisLikes,
    userIsLike,
    addUserComment,
    getUserInfo,
    getUserCon,
    getUserCol,
    addUserContent
} = require('../controllers/userController');


router.prefix('/user')

//用户登录
router.post('/login',userLogin);

//用户注册
router.post('/register',userRegister);

//查询用户是否订阅专题
router.post('/issub',getIsSubCol);

//添加订阅
router.post('/addcol',getAddUserCol);

//减少订阅
router.post('/cancelcol',getCancelUserCol);

//用户是否点赞
router.get('/islikes',userIsLike);

//用户点赞
router.post('/likes',getUserLikes);

//用户取消点赞
router.post('/dislikes',getUserDisLikes);

//用户评论
router.post('/comment',addUserComment);

//用户信息
router.post('/info',getUserInfo);

//用户投稿
router.post('/con',getUserCon);

//用户订阅
router.post('/col',getUserCol);

//用户投稿
router.post('/addCon',addUserContent);

module.exports = router
