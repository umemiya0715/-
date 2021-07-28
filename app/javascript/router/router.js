import Vue from 'vue';
import Router from 'vue-router';
import store from '../store/index';

import Top from '../pages/top/index.vue';
import Help from '../pages/help/index.vue';
import Term from '../pages/term/index.vue';
import PrivacyPolicy from '../pages/privacy_policy/index.vue';
import Result from '../pages/result/index.vue';
import Analysis from '../pages/analysis/index.vue';
import Register from '../pages/register/index.vue';
import Login from '../pages/login/index.vue';

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Top,
      name: "Top",
    },
    {
      path: "/help",
      component: Help,
      name: "Help",
    },
    {
      path: "/term",
      component: Term,
      name: "Term",
    },
    {
      path: "/privacypolicy",
      component: PrivacyPolicy,
      name: "PrivacyPolicy",
    },
    {
      path: "/result",
      component: Result,
      name: "Result",
    },
    {
      path: "/analysis",
      component: Analysis,
      name: "Analysis",
    },
    {
      path: "/register",
      component: Register,
      name: "Register",
    },
    {
      path: "/login",
      component: Login,
      name: "Login",
    },
  ],
})

export default router
