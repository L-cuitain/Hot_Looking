const {
    getNewsByNId ,
    getHotArticlesByWeek ,
    getCommentByNid ,
    getCommentTotal,
    getArticleByAId,
    getCommentByAid,
    getACommentTotal,
    getVideoByVId,
    getCommentByVid,
    getVCommentTotal
} = require("../models/detailModel");
const {  getTimeForNow , getTimeHMS } = require("../utils/time");

//获取资讯内容
module.exports.getNewsContent = async (ctx) => {
    const { nId } = ctx.query;
    const data = await getNewsByNId(nId);
    getTimeHMS(data);
    ctx.body = {
        code: 200,
        message: "获取资讯内容成功",
        result: data
    }
}

//获取本周最热文章
module.exports.getHotArticles = async (ctx) => {
    const data = await getHotArticlesByWeek();
    ctx.body = {
        code: 200,
        message: "获取本周最热成功",
        result: data
    }
}

//获取资讯评论
module.exports.getComment = async (ctx) => {
    const { nId , current } = ctx.query;
    const offsetNum = (current-1)*10;
    const data = await getCommentByNid(nId,offsetNum);
    getTimeHMS(data);
    const num = await getCommentTotal(nId);
    const comment = {
        list: data,
        total: num[0].total
    }
    ctx.body = {
        code : 200,
        message: "获取资讯评论成功",
        result: comment
    }
}

//获取文章内容
module.exports.getArticleContent = async (ctx) => {
    const { aId } = ctx.query;
    const data = await getArticleByAId(aId);
    getTimeForNow(data);
    ctx.body = {
        code: 200,
        message: "获取文章内容成功",
        result: data
    }
}
//获取指定文章评论
module.exports.getAComment = async (ctx) => {
    const { aId , current } = ctx.query;
    const offsetNum = (current-1)*10;
    const data = await getCommentByAid(aId,offsetNum);
    getTimeHMS(data);
    const num = await getACommentTotal(aId);
    const comment = {
        list: data,
        total: num[0].total
    }
    ctx.body = {
        code : 200,
        message: "获取文章评论成功",
        result: comment
    }
}

//获取指定视频内容
module.exports.getVideosContent = async (ctx) => {
    const { vId } = ctx.query;
    const data = await getVideoByVId(vId);
    getTimeForNow(data);
    ctx.body = {
        code: 200,
        message: "获取视频内容成功",
        result: data
    }
}
//获取指定视频评论
module.exports.getVComment = async (ctx) => {
    const { vId , current} = ctx.query;
    const offsetNum = (current-1)*10;
    const data = await getCommentByVid(vId,offsetNum);
    getTimeHMS(data);
    const num = await getVCommentTotal(vId);
    const comment = {
        list: data,
        total: num[0].total
    }
    ctx.body = {
        code : 200,
        message: "获取视频评论成功",
        result: comment
    }
}