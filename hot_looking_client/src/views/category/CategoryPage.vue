<template>
  <AppLayout>
    <div class="category">
      <!-- 标题 -->
      <el-row>
        <el-col :span="24">
          <img
            src="@/assets/banner/games.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L01'"
          />
          <img
            src="@/assets/banner/life.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L02'"
          />
          <img
            src="@/assets/banner/tech.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L03'"
          />
          <img
            src="@/assets/banner/design.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L04'"
          />
          <img
            src="@/assets/banner/film.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L05'"
          />
          <img
            src="@/assets/banner/story.png"
            class="banner_img"
            alt=""
            v-if="Lid === 'L06'"
          />
        </el-col>
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
