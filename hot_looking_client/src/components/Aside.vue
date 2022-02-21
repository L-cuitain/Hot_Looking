<template>
  <div class="logo"><img src="@/assets/logo/热瞩logo.png" alt=""></div>
  <el-menu
      default-active="1"
      class="el-menu-vertical-demo"
      active-text-color="#ec625c"
      background-color="#fff"
      text-color="#000"
      :collapse-transition="false"
      @open="handleOpen"
      @close="handleClose"
  >
    <el-menu-item index="1">
      <el-icon style="margin: 10px"><House /></el-icon>
      <span class="menu-title">首页</span>
      <template #title></template>
    </el-menu-item>
    <el-menu-item index="2">
      <el-icon style="margin: 10px"><Tickets /></el-icon>
      <span class="menu-title">资讯</span>
      <template #title></template>
    </el-menu-item>
    <el-menu-item index="3">
      <el-icon style="margin: 10px"><Guide /></el-icon>
      <span class="menu-title">专题</span>
      <template #title></template>
    </el-menu-item>
    <el-menu-item index="4">
      <el-icon style="margin: 10px"><video-play /></el-icon>
      <span class="menu-title">视频</span>
      <template #title></template>
    </el-menu-item>
  </el-menu>
</template>

<script>
import { ref } from 'vue';

import { House , Tickets , Guide , VideoPlay } from '@element-plus/icons-vue'

export default {
  name: "Aside",
  components:{
    House,
    Tickets,
    Guide,
    VideoPlay
  },
  setup(){
    const isCollapse = ref(true)
    const handleOpen = (key, keyPath) => {
      console.log(key, keyPath)
    }
    const handleClose = (key, keyPath) => {
      console.log(key, keyPath)
    }

    return{
      isCollapse,
      handleOpen,
      handleClose,
    }
  }
}


</script>

<style scoped>
.logo{
  height:100px;
  line-height: 100px;
  font-size: 20px;
  padding: 20px 0;
  background-color: #fff;
}

.menu-title{
  display: inline-block;
  vertical-align: -3%;
  margin: 0 10px;
}

.el-menu-vertical-demo{
  width: 100%;
  min-height: auto;
}
</style>