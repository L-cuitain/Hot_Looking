import { createRouter, createWebHistory } from "vue-router";

//首页
const HomePage = () => import("../views/home/HomePage");
//资讯
const NewsPage = () => import("../views/news/NewsPage");
//专题
const CollectionsPage = () => import("../views/collections/CollectionsPage");
//视频
const VideosPage = () => import("../views/videos/VideosPage");

const routes = [
  {
    path: "/",
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
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
