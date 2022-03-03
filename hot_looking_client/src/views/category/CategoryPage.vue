<template>
  <AppLayout>
    <div class="category">
      <!--      标题-->
      <el-row>
        <el-col :span="24"
          ><img src="@/assets/banner/videos.png" class="banner_img" alt=""
        /></el-col>
      </el-row>
      <!--      导航-->
      <CategoryPageNav :lId="Lid" />
      <!--      列表-->
      <div class="list_container container">
        <CategoryPageTab />
      </div>
    </div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/App/AppLayout";
import AppFooter from "../../components/App/AppFooter";
import CategoryPageNav from "./components/CategoryPageNav";
import CategoryPageTab from "./components/CategoryPageTab";
import { useRoute } from "vue-router";

export default {
  name: "CategoryPage",
  components: {
    AppLayout,
    AppFooter,
    CategoryPageNav,
    CategoryPageTab,
  },
  setup() {
    const router = useRoute();
    const Lid = router.params.id;
    return { Lid };
  },
};
</script>

<style scoped></style>
