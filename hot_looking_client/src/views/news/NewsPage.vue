<template>
  <AppLayout>
    <div class="news">
      <el-row>
        <el-col :span="24"
          ><img src="@/assets/banner/news.png" class="banner_img" alt=""
        /></el-col>
      </el-row>
      <div class="list_container container">
        <NewsPageNav />
        <Suspense>
          <NewsPageList />
        </Suspense>
      </div>
      <AppFooter />
    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/App/AppLayout";
import NewsPageNav from "./components/NewsPageNav";
import NewsPageList from "./components/NewsPageList";
import AppFooter from "../../components/App/AppFooter";

export default {
  name: "InfoPage",
  components: {
    AppLayout,
    NewsPageNav,
    NewsPageList,
    AppFooter,
  },
};
</script>

<style scoped>
.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}
</style>
