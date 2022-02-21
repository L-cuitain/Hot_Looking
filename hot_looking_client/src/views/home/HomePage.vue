<template>
  <div class="common-layout">
  <el-container>
    <el-aside width="250px"><Aside /></el-aside>
    <el-container>
      <el-header height="80px"><Header /></el-header>
      <el-main><MainPage /></el-main>
    </el-container>

  </el-container>
  </div>
</template>

<script>
import Aside from "../../components/Aside";
import Header from "../../components/Header";
import MainPage from "./components/MainPage";

export default {
  name: "HomePage",
  components:{
    Aside,
    Header,
    MainPage
  }
}
</script>

<style scoped>
.common-layout{
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
  height:100%;
}

.common-layout .el-container:nth-child(5) .el-aside,
.common-layout .el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.common-layout .el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
</style>