const {
    logByAcPw ,
    resByNaAcPw,
    getUserByNC,
    isSubCol,
    addUserCol,
    cancelUserCol,
    addColNum,
    reduceColNum,
    confirmUserCol,
    getConAddLikes,
    getConReduceLikes,
    getUserLike,
    setUserLike,
    addUserLike,
    setUserDislike,
    addConComment,
    findUserDetail,
    findUserCon,
    findUserConTotal,
    findUserCol,
    findUserColTotal,
    addHotCon
} = require('../models/userModel');

const { getNewsByCount } = require('../models/newsModel');
const { getArticlesTotal } = require('../models/articlesModel');
const { getVideosTotal } = require('../models/videosModel');
const { getHcId } = require('../utils/getId');
const { getRTForNow } = require('../utils/time');


//引入jwt
const jwt = require('jsonwebtoken');

//登录
module.exports.userLogin = async (ctx) => {
    const { account , password } = ctx.request.body;
    if(account.trim() !== '' && password.trim() !== ''){
        const data = await logByAcPw(account,password)
        //创建token
        const token = jwt.sign({...data[0]},'my_token',{expiresIn: '1h'});
        const user = {...data[0],token};
        if(data[0]){
            ctx.body = {
                code: 200,
                message: "登录成功",
                result: user
            }
        }else{
            ctx.body = {
                code: 400,
                message: "登录失败：用户名或密码错误",
            }
        }
    }else{
        ctx.body = {
            code: 500,
            message: "登录失败：格式错误",
        }
    }
}

//注册
module.exports.userRegister = async (ctx) => {
    const { name,account,password } = ctx.request.body;
    if(name.trim() !== '' && account.trim() !== '' && password.trim() !== ''){
        const data = await getUserByNC(name,account);
        if(!data[0]){
            await resByNaAcPw(name,account,password,'用户');
            ctx.body = {
                code: 200,
                message: "注册成功",
            }
        }else{
            ctx.body = {
                code: 500,
                message: "注册失败，用户名或账号重复",
            }
        }
    }
}

//查询用户是否订阅专题
module.exports.getIsSubCol = async (ctx) => {
    const { uId,colId } = ctx.request.body;
    const data = await isSubCol(uId,colId);
    ctx.body = {
        code: 200,
        message: "获取订阅信息成功",
        result: data
    }
}

//添加用户订阅
module.exports.getAddUserCol = async (ctx) => {
    const { uId , colId } = ctx.request.body;
    const data = await isSubCol(uId,colId);
    if(!data[0]){
        await addUserCol(uId,colId);
    }else{
        await confirmUserCol(colId);
    }
    await addColNum(colId)
    ctx.body = {
        code: 200,
        message: "添加订阅信息成功",
    }
}

//取消用户订阅
module.exports.getCancelUserCol = async (ctx) => {
    const { uId , colId } = ctx.request.body;
    await cancelUserCol(uId,colId);
    await reduceColNum(colId);
    ctx.body = {
        code: 200,
        message: "取消订阅信息成功",
    }
}

//查询用户是否点赞
module.exports.userIsLike = async (ctx) => {
    const { hcId , uId } = ctx.query;
    const data = await getUserLike(hcId,uId);

    if(data.length === 0){
       const result = await addUserLike(hcId,uId,0);
        console.log(result);
    }

    const data1 = await getUserLike(hcId,uId);
    console.log(data1);
    ctx.body = {
        code: 200,
        message: "获取成功",
        result: data1[0].like
    }
}

//用户点赞
module.exports.getUserLikes = async (ctx) => {
    const { hcId , uId } = ctx.request.body;
    const data = await getUserLike(hcId,uId);
    console.log(data);
    console.log(hcId,uId);
    if(data.length === 0){
        await addUserLike(hcId,uId,1);
    }else{
        await setUserLike(hcId,uId);
    }

    await getConAddLikes(hcId);

    ctx.body = {
        code: 200,
        message: "用户点赞成功"
    }
}

//用户取消点赞
module.exports.getUserDisLikes = async (ctx) => {
    const { hcId , uId } = ctx.request.body;
    const data = await getUserLike(hcId,uId);
    if(data.length !== 0){
        await setUserDislike(hcId,uId);
        await getConReduceLikes(hcId);

        ctx.body = {
            code: 200,
            message: "用户取消点赞成功"
        }
    }else{
        ctx.body = {
            code: 500,
            message: "用户取消点赞失败"
        }
    }



}

//用户评论
module.exports.addUserComment = async (ctx) => {
    const { id , uId , content , commentTime } = ctx.request.body;
    await addConComment(id,uId,content,commentTime);

    ctx.body = {
        code: 200,
        message: "用户评论成功"
    }
}

//查询用户详情
module.exports.getUserInfo = async (ctx) => {
    const { uId } = ctx.request.body;
    const data = await findUserDetail(uId);
    ctx.body = {
        code: 200,
        message: "用户信息获取成功",
        result: data
    }
}

//查询用户投稿
module.exports.getUserCon = async (ctx) => {
    const { uId , current} = ctx.request.body;
    const offsetNum = (current-1)*9;
    const count = await findUserConTotal(uId);
    const data = await findUserCon(uId,offsetNum);

    const contribute = {
        list: data,
        total: count[0].total,
        pageSize: 9,
        pageNum: current
    }

    ctx.body = {
        code: 200,
        message: "用户投稿获取成功",
        result: contribute
    }
}

//查询用户订阅
module.exports.getUserCol = async (ctx) => {
    const { uId , current} = ctx.request.body;
    const offsetNum = (current-1)*6;
    const count = await findUserColTotal(uId);
    const data = await findUserCol(uId,offsetNum);

    const collections = {
        list: data,
        total: count[0].total,
        pageSize: 6,
        pageNum: current
    }

    ctx.body = {
        code: 200,
        message: "用户投稿获取成功",
        result: collections
    }
}

//用户投稿
module.exports.addUserContent = async (ctx) => {
    const { form } = ctx.request.body;

    let formData = {...form};
    //给内容添加id
    if(formData.category === "news"){
        //获取资讯数量
        const count = await getNewsByCount();
        //更改id格式
        formData.hcId = getHcId(formData.category, count[0].total);

    }else if(formData.category === "articles"){
        //获取文章数量
        const count = await getArticlesTotal();
        //更改id格式
        formData.hcId = getHcId(formData.category, count[0].total);

    }else if(formData.category === "videos"){
        //获取视频数量
        const count = await getVideosTotal();
        //更改id格式
        formData.hcId = getHcId(formData.category, count[0].total);
    }

    //设置发布时间
    formData.releaseTime = getRTForNow();
    await addHotCon(formData);
    ctx.body = {
        code: 200,
        message: "投稿成功",
    }
}