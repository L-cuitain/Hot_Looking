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
    getNewsLikes,
    getArticlesLikes,
    getVideosLikes,
    addNewsComment,
    addArticlesComment,
    addVideosComment,
    findUserDetail,
    findUserCon,
    findUserConTotal,
    findUserCol,
    findUserColTotal
} = require('../models/userModel');
//引入jwt
const jwt = require('jsonwebtoken');

//登录
module.exports.userLogin = async (ctx) => {
    const { account , password } = ctx.request.body;
    if(account.trim() !== '' && password.trim() !== ''){
        const data = await logByAcPw(account,password)
        console.log(data);
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
            await resByNaAcPw(name,account,password);
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
        console.log(111)
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

//用户点赞
module.exports.getUserLikes = async (ctx) => {
    const { category , num , id } = ctx.request.body;
    if(category === 'new'){
        await getNewsLikes(num,id);
    }else if(category === 'article'){
        await getArticlesLikes(num,id);
    }else if(category === 'video'){
        await getVideosLikes(num,id);
    }

    ctx.body = {
        code: 200,
        message: "用户点赞成功"
    }
}

//用户评论
module.exports.addUserComment = async (ctx) => {
    const { id , uId , content , commentTime } = ctx.request.body;
    console.log( id , uId , content , commentTime);

    if(id.startsWith('N')){
        await addNewsComment(id,uId,content,commentTime);
    }else if(id.startsWith('A')){
        await addArticlesComment(id,uId,content,commentTime);
    }else if(id.startsWith('V')){
        await addVideosComment(id,uId,content,commentTime);
    }

    ctx.body = {
        code: 200,
        message: "用户评论成功"
    }
}

//查询用户详情
module.exports.getUserInfo = async (ctx) => {
    const { uId } = ctx.request.body;
    console.log(uId)
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