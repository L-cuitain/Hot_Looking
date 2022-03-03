const { getLabel } = require("../models/appModel");

//查看所有标签
module.exports.getLabelAll = async (ctx) => {
    const data = await getLabel();
    ctx.body = {
        code: 200,
        message: "获取标签成功",
        result: data
    }
}

