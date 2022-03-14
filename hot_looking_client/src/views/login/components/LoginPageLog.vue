<template>
  <el-form ref="formRef" :model="validateForm" class="ruleForm">
    <el-form-item
      prop="account"
      :rules="[
        { required: true, message: '必须输入账号' },
        { min: 5, max: 15, message: '账号位数在5到15之间' },
      ]"
    >
      <el-input
        v-model="validateForm.account"
        type="text"
        placeholder="请输入账号"
        autocomplete="off"
      ></el-input>
    </el-form-item>
    <el-form-item
      prop="password"
      :rules="[
        { required: true, message: '必须输入密码' },
        { min: 4, max: 15, message: '账号位数在4到15之间' },
      ]"
    >
      <el-input
        v-model="validateForm.password"
        type="text"
        placeholder="请输入密码"
        autocomplete="off"
      ></el-input>
    </el-form-item>
    <el-form-item>
      <el-button
        type="primary"
        class="btn-group-lg"
        @click="submitForm(formRef)"
        >登录</el-button
      >
    </el-form-item>
  </el-form>
</template>

<script>
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import useLoginAfter from "@/hooks/useLoginAfter";
import { login } from "@/api/login";

export default {
  name: "LoginPageLog",
  setup() {
    let timer;
    const formRef = ref();
    const validateForm = reactive({
      account: "",
      password: "",
    });
    const { loginSuccessful } = useLoginAfter();

    //提交表单
    const submitForm = (formEl) => {
      if (!formEl) return;
      formEl.validate((valid) => {
        if (valid) {
          //发送表单
          login(validateForm.account, validateForm.password).then(
            loginSuccessful
          );
        } else {
          if (timer) {
            clearTimeout(timer);
          }
          timer = setTimeout(() => {
            ElMessage({
              message: "表单提交失败：错误的提交格式",
              type: "error",
            });
          }, 600);
          return false;
        }
      });
    };

    return { formRef, validateForm, submitForm };
  },
};
</script>

<style scoped>
:deep(.el-input__inner) {
  display: block;
  width: 100%;
  height: calc(1.5em + 1.35rem + 2px);
  padding: 0.675rem 1.125rem;
  margin: 0.2rem 0;
  font-size: 0.875rem;
  font-weight: 400;
  line-height: 1.5;
  color: #323232;
  background-color: #f6f6f6;
  background-clip: padding-box;
  border: 1px solid #f6f6f6;
  border-radius: 4px;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

:deep(.el-button) {
  background-color: #454647;
  border-color: #323232;
  color: #fff;
  display: block;
  width: 100%;
  height: auto;
  margin-top: 0.5rem;
  padding: 0.5rem 1.5rem;
  font-size: 1.00625rem;
  line-height: 1.5;
  border-radius: 0.3rem;
}
</style>
