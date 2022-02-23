<template>
  <el-row class="row-bg" justify="space-around">
    <el-col :span="7"
      ><a href="#">
        <svg
          t="1645497252167"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="4157"
          width="20"
          height="20"
        >
          <path
            d="M892.928 128q28.672 0 48.64 19.968t19.968 48.64l0 52.224q0 28.672-19.968 48.64t-48.64 19.968l-759.808 0q-28.672 0-48.64-19.968t-19.968-48.64l0-52.224q0-28.672 19.968-48.64t48.64-19.968l759.808 0zM892.928 448.512q28.672 0 48.64 19.968t19.968 48.64l0 52.224q0 28.672-19.968 48.64t-48.64 19.968l-759.808 0q-28.672 0-48.64-19.968t-19.968-48.64l0-52.224q0-28.672 19.968-48.64t48.64-19.968l759.808 0zM892.928 769.024q28.672 0 48.64 19.968t19.968 48.64l0 52.224q0 28.672-19.968 48.64t-48.64 19.968l-759.808 0q-28.672 0-48.64-19.968t-19.968-48.64l0-52.224q0-28.672 19.968-48.64t48.64-19.968l759.808 0z"
            p-id="4158"
          ></path>
        </svg> </a
    ></el-col>
    <el-col :span="7"
      ><el-input class="w-50 m-2" placeholder="搜索" :prefix-icon="Search"
    /></el-col>
    <el-col :span="7">
      <el-button type="info" class="btn_login" round>登录热瞩🔥</el-button>
    </el-col>
  </el-row>
</template>

<script>
import { Search } from "@element-plus/icons-vue";

export default {
  name: "Header",
  components: {},
  setup() {
    return {
      Search,
    };
  },
};
</script>

<style scoped>
.el-col {
  border-radius: 4px;
}
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.row-bg {
  padding: 10px 0;
  height: 100%;
}

.btn_login {
  background-color: #ec625c;
  margin-left: 225px;
}
</style>
