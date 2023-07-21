<template>
  <el-timeline>
    <el-timeline-item
      v-for="(activity, index) in activities"
      :key="index"
      :icon="activity.icon"
      :type="activity.type"
      :color="activity.color"
      :size="activity.size"
      :hollow="activity.hollow"
      :timestamp="activity.timestamp"
    >
      {{ activity.content }}
    </el-timeline-item>
  </el-timeline>
</template>

<script>
import { MoreFilled } from "@element-plus/icons-vue";

export default {
  name: "ReviewTimeLine",
  setup() {
    const activities = [
      {
        content: "内容投稿成功",
        timestamp: "2018-04-03 20:46",
        size: "large",
      },

      {
        content: "等待审核，审核员：管理员-小小",
        timestamp: "2018-04-12 20:46",
        size: "large",
        type: "primary",
        icon: MoreFilled,
      },
      {
        content: "审核成功，内容已展示",
        timestamp: "2018-04-03 20:46",
        size: "large",
      },
    ];
    return {
      activities,
    };
  },
};
</script>

<style scoped></style>
