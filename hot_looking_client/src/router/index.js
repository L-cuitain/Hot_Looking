import { createRouter, createWebHistory } from "vue-router";

//首页
const HomePage = () => import("../views/home/HomePage");
//资讯
const NewsPage = () => import("../views/news/NewsPage");
//资讯详情
const NewsDetailPage = () => import("../views/detail/NewsDetailPage");
//专题
const CollectionsPage = () => import("../views/collections/CollectionsPage");
//专题详情
const CollectionsDetailPage = () =>
  import("../views/collections/CollectionsDetailPage");
//视频
const VideosPage = () => import("../views/videos/VideosPage");
//视频详情
const VideosDetailPage = () => import("../views/detail/VideosDetailPage");
//文章
const ArticlesPage = () => import("../views/articles/ArticlesPage");
//文章详情
const ArticlesDetailPage = () => import("../views/detail/ArticlesDetailPage");
//分类
const CategoryPage = () => import("../views/category/CategoryPage");
//最新
const TopPage = () => import("../views/Top/TopPage");
//用户
const UserPage = () => import("../views/users/UsersPage");
//登录
const LoginPage = () => import("../views/login/LoginPage");

const routes = [
  {
    path: "/",
    redirect: "/home",
  },
  {
    path: "/login",
    name: "Login",
    component: LoginPage,
  },
  {
    path: "/users/:id",
    name: "User",
    component: UserPage,
  },
  {
    path: "/home",
    name: "Home",
    component: HomePage,
  },
  {
    path: "/news",
    name: "News",
    component: NewsPage,
  },
  {
    path: "/news/detail/:id",
    name: "NewsDetail",
    component: NewsDetailPage,
  },
  {
    path: "/collections",
    name: "Collections",
    component: CollectionsPage,
  },
  {
    path: "/collections/detail/:id",
    name: "CollectionsDetail",
    component: CollectionsDetailPage,
  },
  {
    path: "/videos",
    name: "Videos",
    component: VideosPage,
  },
  {
    path: "/videos/detail/:id",
    name: "VideosDetail",
    component: VideosDetailPage,
  },
  {
    path: "/articles",
    name: "Articles",
    component: ArticlesPage,
  },
  {
    path: "/articles/detail/:id",
    name: "ArticlesDetail",
    component: ArticlesDetailPage,
  },
  {
    path: "/category/:id",
    name: "Category",
    component: CategoryPage,
  },
  {
    path: "/top",
    name: "Top",
    component: TopPage,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
