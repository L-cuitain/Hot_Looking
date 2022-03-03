//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取专题列表
 * @returns {*|Promise}
 */
export function getCollectionsAll(current) {
  return request("/collections/list", "get", { current });
}
