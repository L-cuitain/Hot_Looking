const { getCollection , getCollectionByNum , getVideoByNum , getNewsByComment , getNewsByRTime,getAVByRTime , getIframeByRTime } = require("../models/homeModel");

//获取首页专题
module.exports.getCollections = async (ctx) => {
    const data = await getCollection();
    ctx.body = {
        code: 200,
        message: "获取首页专题成功",
        result: data
    }
}

//获取首页订阅数最多的专题
module.exports.getMaxNumCollection = async (ctx) => {
    const data = await getCollectionByNum();
    ctx.body = {
        code: 200,
        message: "获取推荐专题成功",
        result: data
    }
}

//获取首页推荐视频
module.exports.getHotVideo = async (ctx) => {
    const data = await getVideoByNum();
    ctx.body = {
        code: 200,
        message: "获取推荐视频成功",
        result: data
    }
}

//获取首页推荐资讯
module.exports.getRecommendNews = async (ctx) => {
    const data = await getNewsByComment();
    ctx.body = {
        code: 200,
        message: "获取推荐资讯成功",
        result: data
    }
}

//查询首页最新资讯
module.exports.getUpNews = async (ctx) => {
    const data = await getNewsByRTime();
    ctx.body = {
        code: 200,
        message: "获取最新资讯成功",
        result: data
    }
}

//查询首页最新文章与视频
module.exports.getUpAV = async (ctx) => {
    const data = await getAVByRTime();
    ctx.body = {
        code: 200,
        message: "获取最新文章和视频成功",
        result: data
    }
}

//查询首页播放视频
module.exports.getPlayIframe = async (ctx) => {
    const data = await getIframeByRTime();
    ctx.body = {
        code: 200,
        message: "获取首页播放视频成功",
        result: data
    }
}

