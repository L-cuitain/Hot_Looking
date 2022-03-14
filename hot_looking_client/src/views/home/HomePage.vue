<template>
  <div class="main">
    <el-row>
      <el-col :span="24"
        ><img src="@/assets/banner/home.png" alt="" class="banner_img"
      /></el-col>
    </el-row>
    <HomePageNav />
    <HomePageInfo />
    <HomePageNews />
    <HomePageVideo />
    <HomePageTopic :title="`专题`" />
    <AppFooter />
  </div>
</template>

<script>
import HomePageNav from "./components/HomePageNav";
import HomePageInfo from "./components/HomePageInfo";
import HomePageNews from "./components/HomePageNews";
import HomePageVideo from "./components/HomePageVideo";
import HomePageTopic from "./components/HomePageTopic";
import AppFooter from "../../components/App/AppFooter";

export default {
  name: "HomePage",
  components: {
    HomePageNav,
    HomePageInfo,
    HomePageNews,
    HomePageVideo,
    HomePageTopic,
    AppFooter,
  },
};
</script>

<style scoped>
.main {
  overflow: hidden;
}
</style>
