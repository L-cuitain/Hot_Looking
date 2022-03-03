const { getNewsByRTime , getNewsByLikes , getNewsAll , getNewsByCount} =  require('../models/newsModel');

// 查询最新资讯
module.exports.getTopNews = async (ctx) => {
    const data = await getNewsByRTime();
    ctx.body = {
        code: 200,
        message: "获取资讯页最新资讯成功",
        result: data
    }
}

//查询最热资讯
module.exports.getHotNews = async (ctx) => {
    const data = await getNewsByLikes();
    ctx.body = {
        code: 200,
        message: "获取资讯页最热资讯成功",
        result: data
    }
}

//查询资讯列表
module.exports.getNewsList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getNewsByCount();
    //请求资讯分页数据
    const data = await getNewsAll(offsetNum);
    console.log(data)
    //封装参数
    const news = {
        newsList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取资讯页列表成功",
        result: news
    }
}