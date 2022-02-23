<template>
  <AppLayout>
    <div class="main">
      <HomePageNav />
      <HomePageInfo />
      <HomePageNews />
      <HomePageVideo />
      <HomePageTopic />
      <AppFooter />
    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/AppLayout";
import HomePageNav from "./components/HomePageNav";
import HomePageInfo from "./components/HomePageInfo";
import HomePageNews from "./components/HomePageNews";
import HomePageVideo from "./components/HomePageVideo";
import HomePageTopic from "./components/HomePageTopic";
import AppFooter from "../../components/AppFooter";

export default {
  name: "HomePage",
  components: {
    AppLayout,
    HomePageNav,
    HomePageInfo,
    HomePageNews,
    HomePageVideo,
    HomePageTopic,
    AppFooter
  },
};
</script>

<style scoped>
.main {
  overflow: hidden;
}
</style>
