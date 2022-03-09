const {
    getCollectionsAll ,
    getCollectionsTotal ,
    getCollectionByColId,
    getDetailAllList,
    getDetailALlTotal,
    getDetailNewsList,
    getDetailNewsTotal,
    getDetailArticlesList,
    getDetailArticlesTotal,
    getDetailVideosList,
    getDetailVideosTotal
} = require("../models/collectionsModel");
const {getTimeForNow} = require("../utils/time");

//查询所有专题
module.exports.getCollectionList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getCollectionsTotal();
    //请求资讯分页数据
    const data = await getCollectionsAll(offsetNum);
    //封装参数
    const collections = {
        colList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题页成功",
        result: collections
    }
}

//根据专题id查询指定专题
module.exports.getSpecifyCollection = async (ctx) => {
    const result = ctx.query;
    const collection = await getCollectionByColId(result.colId);

    ctx.body = {
        code: 200,
        message: "获取指定专题成功",
        result: collection
    }
}

//根据专题id查询所有列表
module.exports.getAllList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getDetailALlTotal(result.colId);
    //请求资讯分页数据
    const data = await getDetailAllList(result.colId,offsetNum);
    getTimeForNow(data);
    //封装参数
    const all = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题全部详情成功",
        result: all
    }
}

//根据专题id查询资讯列表
module.exports.getNewsList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getDetailNewsTotal(result.colId);
    //请求资讯分页数据
    const data = await getDetailNewsList(result.colId,offsetNum);
    getTimeForNow(data);
    //封装参数
    const news = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题资讯详情成功",
        result: news
    }
}

//根据专题id查询文章列表
module.exports.getArticlesList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getDetailArticlesTotal(result.colId);
    //请求资讯分页数据
    const data = await getDetailArticlesList(result.colId,offsetNum);
    getTimeForNow(data);
    //封装参数
    const articles = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题文章详情成功",
        result: articles
    }
}

//根据专题id查询视频列表
module.exports.getVideosList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getDetailVideosTotal(result.colId);
    //请求资讯分页数据
    const data = await getDetailVideosList(result.colId,offsetNum);
    getTimeForNow(data);
    //封装参数
    const videos = {
        list: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题视频详情成功",
        result: videos
    }
}
