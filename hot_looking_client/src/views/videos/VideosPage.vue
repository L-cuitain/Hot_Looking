<template>
  <AppLayout>
    <div class="videos">
      <!--      导航-->
      <el-row>
        <el-col :span="24"
          ><img src="@/assets/banner/videos.png" class="banner_img" alt=""
        /></el-col>
      </el-row>
      <!--      列表-->
      <div class="list_container container">
        <Suspense>
          <VideoPageList />
        </Suspense>
      </div>
      <!--      推荐-->
      <VideoPageCommend />
    </div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/App/AppLayout";
import VideoPageList from "./components/VideoPageList";
import AppFooter from "../../components/App/AppFooter";
import VideoPageCommend from "./components/VideoPageCommend";

export default {
  name: "VideoPage",
  components: {
    AppLayout,
    VideoPageList,
    VideoPageCommend,
    AppFooter,
  },
};
</script>

<style scoped>
.videos {
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
