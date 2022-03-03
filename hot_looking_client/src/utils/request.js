//第一步: 创建新的axios实例对象
//导入用户发送请求的底层库
import axios from "axios";
import store from "../store";
import router from "../router";

//导出基准地址
export const baseURL = "http://localhost:3000";

//创建请求实例对象(不包含token)
const instanceWithoutToken = axios.create({ baseURL });
//创建请求实例对象(包含token)
const instanceWithToken = axios.create({ baseURL });

//用于返回 response.data
const onResponseFulfilled = (response) => response.data;

//用户捕获错误,传递错误
const onRejected = (error) => Promise.reject(error);

//第二步: 添加请求拦截器,实现在请求头中添加token
//请求拦截器(在请求头中添加 token)
instanceWithToken.interceptors.request.use((config) => {
  //当前回调函数在请求发送之前执行
  //获取token
  const token = store.state.user.profile.token;
  //判断 token 是否存在
  if (token) {
    //将 token 存储在请求头中
    config.headers.Authorization = `Bearer ${token}`;
  }
  //返回配置
  return config;
}, onRejected);

//第三步: 添加响应拦截器,实现减少数据层级,处理token过期情况
//响应拦截器(携带token) 返回 response.data , 处理服务器端返回未授权的情况,捕获错误传递错误
instanceWithToken.interceptors.response.use(onResponseFulfilled, (error) => {
  //当响应状态码为失败时执行当前回调函数
  //请求未授权,表示没有登录或登录状态失败
  if (error.response.status === 401) {
    //清空用户信息
    store.commit("user/setUser", {});
    //跳转到登陆页面
    router.push("/login").then(() => {});
  }
  return Promise.reject(error);
});

//响应拦截器(不携带token) 返回 response.data , 捕获错误传递错误
instanceWithoutToken.interceptors.response.use(onResponseFulfilled, onRejected);

//第四步: 导出 用于发送请求的函数
//生成请求函数所需参数
const generateRequestConfig = (url, method, data) => ({
  url,
  method,
  [method.toLowerCase() === "get" ? "params" : "data"]: data,
});

//请求函数(不携带token)
export default function request(url, method, data) {
  return instanceWithoutToken(generateRequestConfig(url, method, data));
}

//请求函数(携带token)
export function requestWithToken(url, method, data) {
  return instanceWithToken(generateRequestConfig(url, method, data));
}
