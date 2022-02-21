<template>
  <el-row class="row-bg" justify="space-around">
    <el-col :span="6"><el-icon><Menu /></el-icon></el-col>
    <el-col :span="6"><el-input
        class="w-50 m-2"
        placeholder="搜索"
        :prefix-icon="Search"
    /></el-col>
    <el-col :span="6">
      <el-button type="info" class="btn_login" round>登录热瞩🔥</el-button>
    </el-col>
  </el-row>
</template>

<script>
import { Menu,Search } from '@element-plus/icons-vue';

export default {
  name: "Header",
  components:{
    Menu,
  },
  setup(){
    return {
      Search
    }
  }
}
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

.btn_login{
  background-color: #ec625c;
  margin-left: 185px;
}
</style>