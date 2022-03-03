//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取标签项
 * @returns {*|Promise}
 */
export function getLabel() {
  return request("app/label", "get");
}
