<template>
  <RouterLink class="logo" to="/home"
    ><img src="@/assets/logo/热瞩logo.png" alt=""
  /></RouterLink>
  <div class="aside_menu">
    <el-menu
      :default-active="isActive"
      class="el-menu-vertical"
      active-text-color="#ec625c"
      background-color="#fff"
      text-color="#000"
      :router="true"
      :unique-opened="true"
    >
      <el-menu-item index="/home">
        <el-icon class="aside_icon"><House /></el-icon>
        <template #title>
          <span class="menu-title">首页</span>
        </template>
      </el-menu-item>

      <el-menu-item index="/news">
        <el-icon class="aside_icon"><Monitor /></el-icon>
        <template #title>
          <span class="menu-title">资讯</span>
        </template>
      </el-menu-item>

      <el-menu-item index="/collections">
        <el-icon class="aside_icon"><Guide /></el-icon>
        <template #title>
          <span class="menu-title">专题</span>
        </template>
      </el-menu-item>

      <el-menu-item index="/articles">
        <el-icon class="aside_icon"><Document /></el-icon>
        <template #title>
          <span class="menu-title">文章</span>
        </template>
      </el-menu-item>

      <el-menu-item index="/videos">
        <el-icon class="aside_icon"><video-play /></el-icon>
        <template #title>
          <span class="menu-title">视频</span>
        </template>
      </el-menu-item>

      <el-sub-menu index="">
        <template #title>
          <el-icon class="aside_icon"><Notebook /></el-icon>
          <span class="menu-title">标签</span>
        </template>
        <el-menu-item-group>
          <el-menu-item
            :index="`/category/${item.lId}`"
            style="padding-left: 40px"
            v-for="item in labels"
            :key="item.lId"
          >
            <el-icon class="aside_icon"><CollectionTag /></el-icon>
            {{ item.lName }}
          </el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
    </el-menu>
  </div>
</template>

<script>
import { ref, watch } from "vue";
import { useRoute } from "vue-router";
import {
  House,
  Guide,
  VideoPlay,
  Document,
  Notebook,
  CollectionTag,
  Monitor,
} from "@element-plus/icons-vue";
import { getLabel } from "@/api/app";

export default {
  name: "Aside",
  components: {
    House,
    Guide,
    VideoPlay,
    Document,
    Notebook,
    CollectionTag,
    Monitor,
  },

  setup() {
    const route = useRoute();
    const isActive = ref();
    watch(
      () => route.fullPath,
      (n) => {
        let arr = n.split("/");
        if (arr[1] !== "") {
          isActive.value = "/" + arr[1];
        }
      },
      { immediate: true }
    );
    const { labels } = useAppLabel();

    return { labels, isActive };
  },
};

function useAppLabel() {
  //用于获取所有标签
  const labels = ref();

  //获取请求的标签数据
  const getData = () => {
    getLabel().then((data) => {
      labels.value = data.result;
    });
  };

  getData();

  return { labels };
}
</script>

<style scoped>
.logo {
  display: block;
  height: 9rem;
  line-height: 100px;
  font-size: 20px;
  padding: 20px 0;
  background-color: #fff;
}

.menu-title {
  display: inline-block;
  vertical-align: -3%;
  margin: 0 10px;
}

.aside_menu {
  width: 100%;
  height: 36.1rem;
  overflow-y: scroll;
}

.el-menu-vertical {
  width: 100%;
  min-height: auto;
}

.aside_icon {
  width: 20px;
  height: 20px;
  margin: 10px;
}
.aside_active {
  fill: #ec625c;
}
</style>
