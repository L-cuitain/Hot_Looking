<template>
  <div class="articles">
    <!--      导航-->
    <el-row>
      <el-col :span="24"
        ><img src="@/assets/banner/articles.png" class="banner_img" alt=""
      /></el-col>
    </el-row>
    <!--      列表-->
    <div class="list_container container">
      <Suspense>
        <ArticlesPageList />
      </Suspense>
    </div>
    <!--      推荐专题-->
    <HomePageTopic :title="`专题推荐`" />
  </div>
  <AppFooter />
</template>

<script>
import ArticlesPageList from "./components/ArticlesPageList";
import AppFooter from "../../components/App/AppFooter";
import HomePageTopic from "../home/components/HomePageTopic";

export default {
  name: "ArticlesPage",
  components: {
    ArticlesPageList,
    AppFooter,
    HomePageTopic,
  },
};
</script>

<style scoped>
.articles {
  width: 100%;
  background-color: #fcfcfc;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}
</style>
