//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取文章列表
 * @param current
 * @returns {*|Promise}
 */
export function getArticlesAll(current) {
  return request("/articles/list", "get", { current });
}
