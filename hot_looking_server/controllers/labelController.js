const {
    getVideoByLikes ,
    getCollectionByLabel ,
    getHotByLabel ,
    getListByLabel  ,
    getTotalByLabel ,
    getArticlesListByLabel ,
    getArticlesCountByLabel ,
    getVideosListByLabel ,
    getVideosCountByLabel ,
    getNewsListByLabel ,
    getNewsCountByLabel
} = require("../models/labelModel");

//根据标签id查询3篇最热视频
module.exports.getHotVideo = async (ctx) => {
    const result = ctx.query;
    const data = await getVideoByLikes(result.lId);
    ctx.body = {
        code: 200,
        message: "获取最热视频成功",
        result: data
    }
}

//根据标签id查询3篇最热文章
module.exports.getHotNews = async (ctx) => {
    const result = ctx.query;
    const data = await getHotByLabel(result.lId);
    ctx.body = {
        code: 200,
        message: "获取最热文章成功",
        result: data
    }
}

//根据标签id查询推荐专题
module.exports.getHotCollection = async (ctx) => {
    const result = ctx.query;
    const data = await getCollectionByLabel(result.lId);

    ctx.body = {
        code: 200,
        message: "获取推荐专题成功",
        result: data
    }
}

//根据标签查询对应列表
module.exports.getLabelList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getTotalByLabel(result.lId);
    //请求资讯分页数据
    const data = await getListByLabel(result.lId,offsetNum);
    //封装参数
    const label = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取标签列表成功",
        result: label
    }
}

//根据标签id查询资讯列表
module.exports.getNewsList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getNewsCountByLabel(result.lId);
    //请求资讯分页数据
    const data = await getNewsListByLabel(result.lId,offsetNum);
    //封装参数
    const news = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取分类资讯列表成功",
        result: news
    }
}

//根据标签id查询视频列表
module.exports.getVideosList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getVideosCountByLabel(result.lId);
    //请求资讯分页数据
    const data = await getVideosListByLabel(result.lId,offsetNum);
    //封装参数
    const videos = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取分类资讯列表成功",
        result: videos
    }
}

//根据标签id查询文章列表
module.exports.getArticlesList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getArticlesCountByLabel(result.lId);
    //请求资讯分页数据
    const data = await getArticlesListByLabel(result.lId,offsetNum);
    //封装参数
    const articles = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取分类资讯列表成功",
        result: articles
    }
}