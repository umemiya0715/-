import Vue from 'vue';
import Router from 'vue-router';

import Top from '../pages/top/index.vue';
import Help from '../pages/help/index.vue';
import Term from '../pages/term/index.vue';
import PrivacyPolicy from '../pages/privacy_policy/index.vue';
import Result from '../pages/result/index.vue';
import Analysis from '../pages/analysis/index.vue';
import Register from '../pages/register/index.vue';
import Login from '../pages/login/index.vue';
import NotFound from '../pages/shared/NotFound.vue';

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
    {
      name: "NotFound",
      path: "*",
      component: NotFound,
      meta: { title: "お探しのページは見つかりませんでした" },
    },
  ],
  scrollBehavior(to, from, savedPosition){
    return { x: 0, y: 0}
  },
})

export default router
