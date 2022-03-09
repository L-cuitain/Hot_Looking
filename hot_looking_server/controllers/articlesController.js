const { getArticlesAll , getArticlesTotal } = require("../models/articlesModel");
const {getTimeForNow} = require("../utils/time");

//获取文章列表
module.exports.getArticlesList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getArticlesTotal();
    //请求资讯分页数据
    const data = await getArticlesAll(offsetNum);
    getTimeForNow(data);
    //封装参数
    const articles = {
        articlesList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取文章页列表成功",
        result: articles
    }
}