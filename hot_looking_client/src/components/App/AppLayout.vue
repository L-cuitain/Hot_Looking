<template>
  <div class="common-layout">
    <el-container>
      <el-aside width="270px">
        <AppAside />
      </el-aside>
      <el-container>
        <el-main @scroll="backTop">
          <slot />
        </el-main>
      </el-container>
    </el-container>
  </div>

  <AppBackTop @goTop="goTop" />
</template>

<script>
import AppBackTop from "./AppBackTop";
import AppAside from "./AppAside";

import { ref } from "vue";

export default {
  name: "AppLayout",
  components: {
    AppAside,
    AppBackTop,
  },
  setup() {
    const scrollTop = ref(0);

    const backTop = (e) => {
      scrollTop.value = e;
    };
    //返回顶部
    const goTop = () => {
      scrollTop.value.srcElement.scrollTop = 0;
    };
    return { backTop, scrollTop, goTop };
  },
};
</script>

<style scoped>
.common-layout {
  height: 100%;
}

.common-layout .el-header {
  background-color: #fcfcfd;
  line-height: 60px;
  padding: 0;
}

.common-layout .el-aside {
  background-color: #fff;
}

.common-layout .el-main {
  padding: 0;
}

.common-layout > .el-container {
  margin-bottom: 40px;
  height: 100%;
}

.common-layout .el-container:nth-child(5) .el-aside,
.common-layout .el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.common-layout .el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
</style>
