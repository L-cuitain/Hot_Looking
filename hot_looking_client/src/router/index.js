import { createRouter, createWebHistory } from "vue-router";

//首页
const HomePage = () => import("../views/home/HomePage");
//资讯
const NewsPage = () => import("../views/news/NewsPage");
//专题
const CollectionsPage = () => import("../views/collections/CollectionsPage");
//视频
const VideosPage = () => import("../views/videos/VideosPage");
//文章
const ArticlesPage = () => import("../views/articles/ArticlesPage");
//分类
const CategoryPage = () => import("../views/category/CategoryPage");
//最新
const TopPage = () => import("../views/Top/TopPage");

const routes = [
  {
    path: "/",
    redirect: "/home",
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
    path: "/collections",
    name: "Collections",
    component: CollectionsPage,
  },
  {
    path: "/videos",
    name: "Videos",
    component: VideosPage,
  },
  {
    path: "/articles",
    name: "Articles",
    component: ArticlesPage,
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
  scrollBehavior: () => ({ top: 0 }),
  routes,
});

export default router;
